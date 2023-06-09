/*
 * Copyright 2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 * http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 * The license is detailed in the file LICENSE.md, and applies to this file.
 *
 * Written by Nir Drucker and Shay Gueron
 * AWS Cryptographic Algorithms Group.
 * (ndrucker@amazon.com, gueron@amazon.com)
 */

#pragma once

#include "types.h"

////////////////////////////////////////////////////////////////
// Below three APIs (keygen, encaps, decaps) are defined by NIST:
////////////////////////////////////////////////////////////////
// Keygenerate - pk is the public key,
//               sk is the private key,
int
crypto_kem_keypair(OUT unsigned char *pk, OUT unsigned char *sk);

// Encapsulate - pk is the public key,
//               ct is a key encapsulation message (ciphertext),
//               ss is the shared secret.
int
crypto_kem_enc(OUT unsigned char *ct, OUT unsigned char *ss, IN const unsigned char *pk);

// Decapsulate - ct is a key encapsulation message (ciphertext),
//               sk is the private key,
//               ss is the shared secret
int
crypto_kem_dec_pickyfix(OUT unsigned char *     ss,
                        IN const unsigned char *ct,
                        IN const unsigned char *sk);

int
crypto_kem_dec_bgf(OUT unsigned char *ss, IN const unsigned char *ct, IN const unsigned char *sk);
