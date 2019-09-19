Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BC13B79D1
	for <lists+linux-leds@lfdr.de>; Thu, 19 Sep 2019 14:53:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390413AbfISMxV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 19 Sep 2019 08:53:21 -0400
Received: from smtp.220.in.ua ([89.184.67.205]:48125 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390418AbfISMxV (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 19 Sep 2019 08:53:21 -0400
Received: from oleh-pc.lan (unknown [95.67.115.55])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp.220.in.ua (Postfix) with ESMTPSA id 695221A242D1;
        Thu, 19 Sep 2019 15:53:18 +0300 (EEST)
From:   Oleh Kravchenko <oleg@kaa.org.ua>
To:     devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com
Subject: v11 EL15203000
Date:   Thu, 19 Sep 2019 15:53:11 +0300
Message-Id: <20190919125313.24081-1-oleg@kaa.org.ua>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

[PATCH v11 1/2] dt-bindings: Add docs for EL15203000
[PATCH v11 2/2] leds: add LED driver for EL15203000 board

v11 changes:
- remove deprecated label property description.

v10 changes:
- move ASCII art to ABI/testing.

v9 changes:
- updated Documentation/devicetree/bindings/leds/leds-el15203000.txt
  after code review from Dan Murphy.

v8 changes:
- removed odd spaces;
- use only one return in el15203000_pattern_set_P();
- reduce returns in el15203000_probe_dt();
- remove ret variable from el15203000_probe().

v7 changes:
- fixed compilation error missing variable led;
- compiled and checked on real device.

v6 changes:
- add 'repeat' entity in test documentation;
- remove variable i;
- move few lines of code to make code clear.

