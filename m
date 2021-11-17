Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E60B455025
	for <lists+linux-leds@lfdr.de>; Wed, 17 Nov 2021 23:05:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241024AbhKQWIf (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 17 Nov 2021 17:08:35 -0500
Received: from smtprelay02.ispgateway.de ([80.67.18.14]:36368 "EHLO
        smtprelay02.ispgateway.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241062AbhKQWIe (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 17 Nov 2021 17:08:34 -0500
Received: from [92.206.166.137] (helo=note-book.lan)
        by smtprelay02.ispgateway.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <git@apitzsch.eu>)
        id 1mnH2a-0002o1-KT; Wed, 17 Nov 2021 10:15:40 +0100
From:   =?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>
To:     linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>
Cc:     =?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>
Subject: [PATCH 0/3] Add support for ocp8110 flash
Date:   Wed, 17 Nov 2021 10:14:02 +0100
Message-Id: <20211117091405.7412-1-git@apitzsch.eu>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Df-Sender: YW5kcmVAYXBpdHpzY2guZXU=
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The led is used as front flash of BQ Aquaris M5.

https://github.com/bq/aquaris-M5/blob/901d0b2ca05c0b0af49786fb548eb0fc289867ff/arch/arm/boot/dts/qcom/piccolo-msm8939-camera-sensor-qrd.dtsi#L16

André Apitzsch (3):
  leds: sgm3140: Add ocs,ocp8110 compatible
  dt-bindings: vendor-prefixes: Add ocs prefix
  dt-bindings: leds: sgm3140: Document ocp8110 compatible

 Documentation/devicetree/bindings/leds/leds-sgm3140.yaml | 4 +++-
 Documentation/devicetree/bindings/vendor-prefixes.yaml   | 2 ++
 drivers/leds/flash/leds-sgm3140.c                        | 1 +
 3 files changed, 6 insertions(+), 1 deletion(-)

-- 
2.34.0

