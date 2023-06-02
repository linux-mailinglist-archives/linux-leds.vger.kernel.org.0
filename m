Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 266F0720382
	for <lists+linux-leds@lfdr.de>; Fri,  2 Jun 2023 15:38:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235666AbjFBNiZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 2 Jun 2023 09:38:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235354AbjFBNiY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 2 Jun 2023 09:38:24 -0400
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0687137
        for <linux-leds@vger.kernel.org>; Fri,  2 Jun 2023 06:38:23 -0700 (PDT)
Date:   Fri, 02 Jun 2023 13:38:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1685713100; x=1685972300;
        bh=bsHSAN20PI+leXRVPAKhT58R/jP9fMKdBTvAX0E8FqU=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=DNccUdTJebMvcEBYi5E1OBB0768TRLbkYqrJUHLtZ9tns+jgLFGq9evDSFUyLzmqG
         G7BCNMchvygYVc1pkDGuBl+ipJwYaaPjpl28ZtqxcS4CyayG2mC1EJ8mh6Y468dH2D
         27GMl3y45RL4JN9pHalBVka8l2cV4d6vCsdOdlJ35CfKpGVN7yvhKT8DVBPPmb8pWu
         aBfcUhFki+oRA3xJYAybc9EJSqNLnZEbBW+wVdXiYFD60G1Xi7Jzwh6w0MF3+Xx/72
         Dotx5FX+ybQXEEv6yK+c3JgMjub153jQBu5WzZ4YRBmiB79mwhe4Tbrniw3mzmGaoV
         TYJ/dDlbXVAAA==
To:     open list <linux-kernel@vger.kernel.org>
From:   Raymond Hackley <raymondhackley@protonmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Luca Weiss <luca@z3ntu.xyz>,
        "open list : LED SUBSYSTEM" <linux-leds@vger.kernel.org>,
        "open list : OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, ~postmarketos/upstreaming@lists.sr.ht
Subject: [RESEND PATCH 1/2] dt-bindings: leds: sgm3140: Document richtek,rt5033 compatible
Message-ID: <20230602133714.260556-1-raymondhackley@protonmail.com>
In-Reply-To: <20230602133533.260502-1-raymondhackley@protonmail.com>
References: <20230602133533.260502-1-raymondhackley@protonmail.com>
Feedback-ID: 49437091:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add devicetree binding for Richtek RT5033 Flash LED charge pump used for
camera flash LEDs.

Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
---
 Documentation/devicetree/bindings/leds/leds-sgm3140.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-sgm3140.yaml b/Doc=
umentation/devicetree/bindings/leds/leds-sgm3140.yaml
index 4d2ffe5fcfc7..37d2a93780ab 100644
--- a/Documentation/devicetree/bindings/leds/leds-sgm3140.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-sgm3140.yaml
@@ -20,6 +20,7 @@ properties:
   compatible:
     enum:
       - ocs,ocp8110
+      - richtek,rt5033-led
       - sgmicro,sgm3140
=20
   enable-gpios:
--=20
2.30.2


