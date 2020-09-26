Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72774279C16
	for <lists+linux-leds@lfdr.de>; Sat, 26 Sep 2020 21:17:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729106AbgIZTRR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 26 Sep 2020 15:17:17 -0400
Received: from mga01.intel.com ([192.55.52.88]:8561 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726183AbgIZTRR (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 26 Sep 2020 15:17:17 -0400
IronPort-SDR: fEsqAAZ8o8KYhvGNeXDfoU53sTzhn8SJL7ofJYUoCiCDnv6+LogUZyS92LYaTOXxp9HDaO34NC
 yw0PTa3iO6nA==
X-IronPort-AV: E=McAfee;i="6000,8403,9756"; a="179945301"
X-IronPort-AV: E=Sophos;i="5.77,307,1596524400"; 
   d="scan'208";a="179945301"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2020 12:17:17 -0700
IronPort-SDR: HTD+MvfiSLLdySKVrqE+Vunpc6mhvWs1KOUtHm4m7rP0E6SKUaWeqV+StBi+6ZFIpQ1PE25/tX
 /jRDHWofLzUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,307,1596524400"; 
   d="scan'208";a="383964675"
Received: from lkp-server01.sh.intel.com (HELO 2dda29302fe3) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 26 Sep 2020 12:17:14 -0700
Received: from kbuild by 2dda29302fe3 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kMFh3-0000Ye-S0; Sat, 26 Sep 2020 19:17:13 +0000
Date:   Sun, 27 Sep 2020 03:16:18 +0800
From:   kernel test robot <lkp@intel.com>
To:     Luka Kovacic <luka.kovacic@sartura.hr>,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org
Cc:     kbuild-all@lists.01.org, lee.jones@linaro.org, pavel@ucw.cz,
        dmurphy@ti.com, robh+dt@kernel.org, jdelvare@suse.com,
        linux@roeck-us.net
Subject: [RFC PATCH] drivers: mfd: iei_wt61p803_puzzle_checksum() can be
 static
Message-ID: <20200926191618.GA12056@2adff5953e79>
References: <20200926135514.26189-3-luka.kovacic@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200926135514.26189-3-luka.kovacic@sartura.hr>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


Signed-off-by: kernel test robot <lkp@intel.com>
---
 iei-wt61p803-puzzle.c |   18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/iei-wt61p803-puzzle.c b/drivers/mfd/iei-wt61p803-puzzle.c
index 5cba010ac9b963..f803222fc8e56f 100644
--- a/drivers/mfd/iei-wt61p803-puzzle.c
+++ b/drivers/mfd/iei-wt61p803-puzzle.c
@@ -118,7 +118,7 @@ struct iei_wt61p803_puzzle {
 	struct mutex lock;
 };
 
-unsigned char iei_wt61p803_puzzle_checksum(unsigned char *buf, size_t len)
+static unsigned char iei_wt61p803_puzzle_checksum(unsigned char *buf, size_t len)
 {
 	unsigned char checksum = 0;
 	unsigned int i;
@@ -302,7 +302,7 @@ int iei_wt61p803_puzzle_write_command(struct iei_wt61p803_puzzle *mcu,
 }
 EXPORT_SYMBOL_GPL(iei_wt61p803_puzzle_write_command);
 
-int iei_wt61p803_puzzle_buzzer(struct iei_wt61p803_puzzle *mcu, bool long_beep)
+static int iei_wt61p803_puzzle_buzzer(struct iei_wt61p803_puzzle *mcu, bool long_beep)
 {
 	unsigned char buzzer_short_cmd[4] = {
 		IEI_WT61P803_PUZZLE_CMD_HEADER_START,
@@ -341,7 +341,7 @@ int iei_wt61p803_puzzle_buzzer(struct iei_wt61p803_puzzle *mcu, bool long_beep)
 	return ret;
 }
 
-int iei_wt61p803_puzzle_get_version(struct iei_wt61p803_puzzle *mcu)
+static int iei_wt61p803_puzzle_get_version(struct iei_wt61p803_puzzle *mcu)
 {
 	struct device *dev = &mcu->serdev->dev;
 	unsigned char version_cmd[3] = {
@@ -420,7 +420,7 @@ int iei_wt61p803_puzzle_get_version(struct iei_wt61p803_puzzle *mcu)
 	return ret;
 }
 
-int iei_wt61p803_puzzle_get_mcu_status(struct iei_wt61p803_puzzle *mcu)
+static int iei_wt61p803_puzzle_get_mcu_status(struct iei_wt61p803_puzzle *mcu)
 {
 	unsigned char mcu_status_cmd[5] = {
 		IEI_WT61P803_PUZZLE_CMD_HEADER_START,
@@ -469,7 +469,7 @@ int iei_wt61p803_puzzle_get_mcu_status(struct iei_wt61p803_puzzle *mcu)
 	return ret;
 }
 
-int iei_wt61p803_puzzle_get_serial_number(struct iei_wt61p803_puzzle *mcu)
+static int iei_wt61p803_puzzle_get_serial_number(struct iei_wt61p803_puzzle *mcu)
 {
 	struct device *dev = &mcu->serdev->dev;
 	unsigned char serial_number_cmd[5] = {
@@ -496,7 +496,7 @@ int iei_wt61p803_puzzle_get_serial_number(struct iei_wt61p803_puzzle *mcu)
 
 }
 
-int iei_wt61p803_puzzle_write_serial_number(struct iei_wt61p803_puzzle *mcu,
+static int iei_wt61p803_puzzle_write_serial_number(struct iei_wt61p803_puzzle *mcu,
 		unsigned char serial_number[36])
 {
 	struct device *dev = &mcu->serdev->dev;
@@ -544,7 +544,7 @@ int iei_wt61p803_puzzle_write_serial_number(struct iei_wt61p803_puzzle *mcu,
 	return ret;
 }
 
-int iei_wt61p803_puzzle_get_mac_addresses(struct iei_wt61p803_puzzle *mcu)
+static int iei_wt61p803_puzzle_get_mac_addresses(struct iei_wt61p803_puzzle *mcu)
 {
 	struct device *dev = &mcu->serdev->dev;
 	unsigned char mac_address_cmd[5] = {
@@ -581,7 +581,7 @@ int iei_wt61p803_puzzle_get_mac_addresses(struct iei_wt61p803_puzzle *mcu)
 	return ret;
 }
 
-int iei_wt61p803_puzzle_write_mac_address(struct iei_wt61p803_puzzle *mcu,
+static int iei_wt61p803_puzzle_write_mac_address(struct iei_wt61p803_puzzle *mcu,
 		unsigned char mac_address[17], int mac_address_idx)
 {
 	struct device *dev = &mcu->serdev->dev;
@@ -630,7 +630,7 @@ int iei_wt61p803_puzzle_write_mac_address(struct iei_wt61p803_puzzle *mcu,
 	return ret;
 }
 
-int iei_wt61p803_puzzle_write_power_loss_recovery(struct iei_wt61p803_puzzle *mcu,
+static int iei_wt61p803_puzzle_write_power_loss_recovery(struct iei_wt61p803_puzzle *mcu,
 		int power_loss_recovery_action)
 {
 	unsigned char power_loss_recovery_cmd[5] = {
