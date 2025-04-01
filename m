Return-Path: <linux-leds+bounces-4388-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 768DCA77DC6
	for <lists+linux-leds@lfdr.de>; Tue,  1 Apr 2025 16:31:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 761EA1891A2B
	for <lists+linux-leds@lfdr.de>; Tue,  1 Apr 2025 14:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3618204F85;
	Tue,  1 Apr 2025 14:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DbvgWOY2"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4935F204C0B;
	Tue,  1 Apr 2025 14:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743517804; cv=none; b=MznTs9XW9WFjlc+QclqyWDkT7rAXOwXHGG22iWdnXNo++3S+v5SlzgFNP3HzxLX51HtQbUuMX9KhJ0MqgCBp8ZUaXBQRmiHzDp5ibhmxdsN25vAk8Q7Mymt/7K0Flcna0tZwPKN1B3mZx8eBDINeIMHxSryiouve+pmDWTnJl5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743517804; c=relaxed/simple;
	bh=5aT0Vi1k+xqWtEzhocv4+cEoo/Fhlmc15jH+tEVAXik=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t265azP+ofStxMPz6QBjvxLI6y8gD5gXJ2s6Ry/gC8yF1KBR2mu56h8LcMRB4NfrB1dLrEM3NnBK9iLs48SPkjz0hdEs5J1/JrKo5/GeQuClimBetLTssTubsL5Iy4wmMUYJGse4X1tFCQvAMm18LfhfnAetbOZ+uPnwjaMMNt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DbvgWOY2; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2279915e06eso114874645ad.1;
        Tue, 01 Apr 2025 07:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743517802; x=1744122602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rVsBRCp8zVFqM6Ir5qAGimm+EcciqA65qMc7SI4hE8I=;
        b=DbvgWOY2fJrCqnA43KiCs9Uf0L2G+gOeUZCMHk2RFlLy1Lp2oL36vnrTr6AU/2GC9J
         +XfR1MQbqo2vnvSuL6V6qFb6ZCDqdJnadCS7AStO1QLzEcqGqOU+cA3Vl9MvdZVNUkNY
         I4L50oecNizSQOvcakGTRSLuxkDIOSZvH4nDDEU+3bnQbSsa84EEinR43496VxU2vFmo
         C5PLj3KOmzLCQMTaYhmOsKiazaekPaUB41WGO7gNXg3+JMKhvSA6PSEJU6LjinagvX4I
         eFGjyWWXySawBrnYp0U4o8fUGY9ScpthgBP64HtRjo9mB10UVRzXKJLpq4AvF0WT6Ila
         Bi9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743517802; x=1744122602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rVsBRCp8zVFqM6Ir5qAGimm+EcciqA65qMc7SI4hE8I=;
        b=HMn5D+VqEqBlYMiTEeMQH/67SPRdFCHpaCNvkfJQSG+qBZ80eV9wAjqUSxYQuk+2oJ
         js+2NQCaYV2QIhl1stAtr2vsMGu7pvqkgQU61VsFlXccuOz6RcJKWrWrcQAbcyBf0OjX
         WShibP9s8Y130b3W/jyexjZcUKI0hYzLiKExRxg/TDB5GDk8NkPP+M58A9n6IudDJs5w
         4dhHmAuHzozNJOyB6dyhutYg85CjkffuELqwCSlWweKSFsHJwTCoHIfYTzm+WWz+rfz1
         VFw01ueeakPmrwUjFU25edBb85VOKZA8tWLYSkd6RRIdb/uWn44Cmg82yhq6kobmou44
         rSSA==
X-Forwarded-Encrypted: i=1; AJvYcCUFi+LJ054DYg0BZYBW0KZ5NQLOPVgYah1owqWpSWknz4hdX4HVA1nh8NvevtUNKhent0W23yQLcRBZog==@vger.kernel.org, AJvYcCWw1U5p1w+Mn4HzMgxycKb0pn3jWVuwZgVM+yGIcRz1UPy/IHzkvSdP0gU4ejVlTUfFSsmikMTwT1oy6Dj/@vger.kernel.org, AJvYcCXz30iCTuCvFlGnRZaS6c0ik/VeDdbKsx7VeITPRpEF8LzDVuONiasCP8TbAyhYMzmKWfCsSuGyxkGS@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1lS9lWr2X9LSNy/TTLdDwYspep3hWapHqVMd7F5sxkm9q+mxR
	NfxLKvXpf7UVf/D5ZSz6CagjmRFU70zNHQvudo9/YtzyFmRpEZbx
X-Gm-Gg: ASbGnctclMmOTm/7SzyRdVmidAxnLZy9iqsrYjxHIGhJNjal90/9PmAA/dzwFkA6OJH
	5FDC/baAwf+wrEfAABO03dUk0G56PmxYxlZjGYd2ioo6RlX4vBkmJ5ia5FcVMxYBS3diIdrEy90
	NRrNtEImFoZSo5DG0FCu1fEua1PKVrefxwh+RwM+6bSW91ZUNbVJs61YkdVqzcP8Tn/kdXA192i
	vsp2rf/1oU7ctroJ15Uwf7knxsJj8wyPltE8eZD71VA4EYbBFfPlUxqfWGPjihQwCRYLfr98tKg
	6bW9PA7Uv1tnb0UQt1QIE22dw21t4Jr+yjOKCMWbGhqEwNoUdfHN7BIRPclqKNSFnO1l
X-Google-Smtp-Source: AGHT+IG+94AfeekEAG6y/22oBIgghPbGZmP0jjSCOSTaY1D8CCsKfb/87Ko5NqqbHw5HJ40H0Ay/cw==
X-Received: by 2002:a17:902:ef4d:b0:224:2200:5940 with SMTP id d9443c01a7336-2292f9d4e35mr245160495ad.38.1743517801786;
        Tue, 01 Apr 2025 07:30:01 -0700 (PDT)
Received: from localhost.localdomain ([123.16.133.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eee210csm89356995ad.70.2025.04.01.07.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 07:30:01 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: krzk+dt@kernel.org
Cc: pavel@kernel.org,
	lee@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: leds: Add LP5812 LED driver
Date: Tue,  1 Apr 2025 21:29:35 +0700
Message-Id: <20250401142935.50906-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <8d9f077b-e656-438c-a9bd-76915d135e24@kernel.org>
References: <8d9f077b-e656-438c-a9bd-76915d135e24@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 31 Mar 2025, Krzysztof Kozlowski wrote:

>Please do not explain me how DT works, we all know. You do not have
>child node. If you disagree - point me to the line in schema having it.

Thank you for your feedback.
I now understand that my schema does not define child nodes, so #address-cells and #size-cells should not be included.
I will update the schema accordingly as shown below.

# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
%YAML 1.2
---
$id: http://devicetree.org/schemas/leds/ti,lp5812.yaml#
$schema: http://devicetree.org/meta-schemas/core.yaml#

title: TI/National Semiconductor LP5812 LED Driver

maintainers:
  - Nam Tran <trannamatk@gmail.com>

description: |
  The LP5812 is an I2C LED Driver that can support LED matrix 4x3.
  For more product information please see the link below:
  https://www.ti.com/product/LP5812#tech-docs

properties:
  compatible:
    const: ti,lp5812

  reg:
    maxItems: 1
    description:
      I2C slave address
      lp5812/12- 0x1b

patternProperties:
  "^led@[0-9a-b]$":
    type: object
    $ref: common.yaml#
    unevaluatedProperties: false

    properties:
      reg:
        minimum: 0
        maximum: 0xb

      chan-name:
        $ref: /schemas/types.yaml#/definitions/string
        description: LED channel name

    required:
      - reg

required:
  - compatible
  - reg

additionalProperties: false

examples:
  - |
    #include <dt-bindings/leds/common.h>

    i2c {
        #address-cells = <1>;
        #size-cells = <0>;

        led-controller@1b {
            compatible = "ti,lp5812";
            reg = <0x1b>;

            led@0 {
                    reg = <0x0>;
                    chan-name = "a0";
            };
            led@1 {
                    reg = <0x1>;
                    chan-name = "a1";
            };
            led@2 {
                    reg = <0x2>;
                    chan-name = "a2";
            };
            led@3 {
                    reg = <0x3>;
                    chan-name = "b0";
            };
            led@4 {
                    reg = <0x4>;
                    chan-name = "b1";
            };
            led@5 {
                    reg = <0x5>;
                    chan-name = "b2";
            };
            led@6 {
                    reg = <0x6>;
                    chan-name = "c0";
            };
            led@7 {
                    reg = <0x7>;
                    chan-name = "c1";
            };
            led@8 {
                    reg = <0x8>;
                    chan-name = "c2";
            };
            led@9 {
                    reg = <0x9>;
                    chan-name = "d0";
            };
            led@a {
                    reg = <0xa>;
                    chan-name = "d1";
            };
            led@b {
                    reg = <0xb>;
                    chan-name = "d2";
            };
        };
    };

...


Best regards,
Nam Tran

