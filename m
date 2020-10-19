Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8886292633
	for <lists+linux-leds@lfdr.de>; Mon, 19 Oct 2020 13:08:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727535AbgJSLIN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 19 Oct 2020 07:08:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:59750 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725776AbgJSLIN (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 19 Oct 2020 07:08:13 -0400
Received: from dellmb.labs.office.nic.cz (nat-1.nic.cz [217.31.205.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A5AAE2224D;
        Mon, 19 Oct 2020 11:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603105692;
        bh=wTqomPJqNndOe6Hv0QPS2Hs3atNqzi42c13z3Zg+0OM=;
        h=From:To:Cc:Subject:Date:From;
        b=nDUGVjR8fRtUYQHbBhZJccFJObd4PZ3DVKMa6h/F3Ic9BafaApjQaq3/f5FSeL729
         VrpuSVx5gk5GBtFRftcD7jV2T8wStn2C8p4iSKhx6SYCIcQ/QFtmIRlXlEx3czeRo0
         4rP3e4HwVxABmsTDZDqE+HpurjsOrHoGOFvdFSx0=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH leds] Documentation: leds: remove invalidated information
Date:   Mon, 19 Oct 2020 13:08:08 +0200
Message-Id: <20201019110808.10689-1-kabel@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The contents of the Future Development section of leds-class
Documentation was invalidated when support for LED-private triggers
was merged. Remove this section.

Signed-off-by: Marek Behún <kabel@kernel.org>
Fixes: 93690cdf3060 ("leds: trigger: add support for LED-private device...")
---
 Documentation/leds/leds-class.rst | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/Documentation/leds/leds-class.rst b/Documentation/leds/leds-class.rst
index a0708d3f3d0b..cd155ead8703 100644
--- a/Documentation/leds/leds-class.rst
+++ b/Documentation/leds/leds-class.rst
@@ -177,13 +177,3 @@ The LED Trigger core cannot be a module as the simple trigger functions
 would cause nightmare dependency issues. I see this as a minor issue
 compared to the benefits the simple trigger functionality brings. The
 rest of the LED subsystem can be modular.
-
-
-Future Development
-==================
-
-At the moment, a trigger can't be created specifically for a single LED.
-There are a number of cases where a trigger might only be mappable to a
-particular LED (ACPI?). The addition of triggers provided by the LED driver
-should cover this option and be possible to add without breaking the
-current interface.
-- 
2.26.2

