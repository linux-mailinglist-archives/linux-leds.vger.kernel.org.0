Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2345957DBF0
	for <lists+linux-leds@lfdr.de>; Fri, 22 Jul 2022 10:13:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234263AbiGVIMA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 22 Jul 2022 04:12:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234812AbiGVIL7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 22 Jul 2022 04:11:59 -0400
Received: from smtpout1.mo3004.mail-out.ovh.net (smtpout1.mo3004.mail-out.ovh.net [79.137.123.219])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCDE99D1CB;
        Fri, 22 Jul 2022 01:11:55 -0700 (PDT)
Received: from pro2.mail.ovh.net (unknown [10.108.1.79])
        by mo3004.mail-out.ovh.net (Postfix) with ESMTPS id DE2A22454B7;
        Fri, 22 Jul 2022 08:11:53 +0000 (UTC)
Received: from localhost.localdomain (88.161.25.233) by DAG1EX1.emp2.local
 (172.16.2.1) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 22 Jul
 2022 10:11:53 +0200
From:   Jean-Jacques Hiblot <jjhiblot@traphandler.com>
To:     <pavel@ucw.cz>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>
CC:     <andy.shevchenko@gmail.com>, <linux-leds@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Jean-Jacques Hiblot <jjhiblot@traphandler.com>
Subject: [RESEND PATCH v6 0/3] Add support for the TLC5925
Date:   Fri, 22 Jul 2022 10:11:43 +0200
Message-ID: <20220722081146.47262-1-jjhiblot@traphandler.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [88.161.25.233]
X-ClientProxiedBy: DAG4EX2.emp2.local (172.16.2.32) To DAG1EX1.emp2.local
 (172.16.2.1)
X-Ovh-Tracer-Id: 6613817531275426267
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvddtvddgtdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffoggfgtghisehtkeertdertddtnecuhfhrohhmpeflvggrnhdqlfgrtghquhgvshcujfhisghlohhtuceojhhjhhhisghlohhtsehtrhgrphhhrghnughlvghrrdgtohhmqeenucggtffrrghtthgvrhhnpeejuefhkeelgffhlefhtefhgeektdevvdfgkeeltdehgeeujeeutdehkeeuhffftdenucfkpheptddrtddrtddrtddpkeekrdduiedurddvhedrvdeffeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepphhrohdvrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepjhhjhhhisghlohhtsehtrhgrphhhrghnughlvghrrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmoheftddtge
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Resending the v6 of the series.

Pavel, do you have any comment/suggestion on this series ?

Thanks,

JJ


Original cover-letter:

This series adds the support for the TLC5925 LED controller.
This LED controller is driven through SPI. There is little internal logic
and it can be thought of as a deserializer + latches.
The TLC5925 itself drives up to 16 LEDs, but multiple TLC5925s can be
chained to drive more.

The first patch describes the dt bindings.
The second patch implements most of the driver and supports only
synchronous brightness setting (brightness_set_blocking).
The last patch implements the non-blocking version (brightness_set).

changes v5->v6:
 * Make the 'ti,shif-register-length' property optional. The default
   value is 16: the length of the shift register of a single TLC5925.
 * fix minor issues in the binding description

 changes v4->v5:
 * add the headers that the code is a direct user of
 * replace dev_err() with dev_err_probe() in ->probe()
 * comestic changes (spaces, alignment and blank lines)

changes v3->v4:
 * add missing MODULE_DEVICE_TABLE(of, ...) 
 * use dev_err_probe() to avoid spamming the log in case of deferred probe
 * use bitmap ops instead of direct memory access + lock
 * sort headers and a few other cosmetic changes.

changes v2->v3:
 * fixed the yaml description of the bindings (now passes dt_binding_check)
 * renamed shit-register-length into ti,shift-register-length and specify
   its type

changes v1->v2:
 * renamed property shift_register_length into shift-register-length
 * add a SPI MODULE_DEVICE_TABLE structure
 * fixed the yaml description of the bindings (now passes dt_binding_check)


Jean-Jacques Hiblot (3):
  dt-bindings: leds: Add bindings for the TLC5925 controller
  leds: Add driver for the TLC5925 LED controller
  leds: tlc5925: Add support for non blocking operations

 .../devicetree/bindings/leds/ti,tlc5925.yaml  | 105 ++++++++++
 drivers/leds/Kconfig                          |   6 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-tlc5925.c                   | 182 ++++++++++++++++++
 4 files changed, 294 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/ti,tlc5925.yaml
 create mode 100644 drivers/leds/leds-tlc5925.c

-- 
2.25.1

