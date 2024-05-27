Return-Path: <linux-leds+bounces-1708-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAD28D016C
	for <lists+linux-leds@lfdr.de>; Mon, 27 May 2024 15:27:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BA211F24962
	for <lists+linux-leds@lfdr.de>; Mon, 27 May 2024 13:27:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D2C915EFAE;
	Mon, 27 May 2024 13:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S8B7pcjp"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2BE15ECFD;
	Mon, 27 May 2024 13:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716816436; cv=none; b=B+0lG6r+XZqPj2fZ/ZfmJZ46sn1sFPEjnDNPYFLvOgt0GG8JvybMJpjkVr1H1dkETiP0QSo8rBftfN0aAFsmkO6Eq2uZxr2BjSfkLTh7ica2NnMztN7d/9kOUcwsKOpPp2LvuwP5vSJJ+MSGK1gEGreZBGhoV7Lw13A8Kh1veDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716816436; c=relaxed/simple;
	bh=wvKfF7CTGkILCYXaRxLo0BRYhRmTr1qU9enaps1pCtI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=l1qjkTjE1WY3ETsYMSBANzDwNMF/sFat3/5oFiPPmfvjjC8iaRY5SxElZr8AEZVJSykrvnafLd2V/khlSZk00jADq6Sif13Du6MYSfg6LMuqzRy5uiIQtsm7HGSSfrFrctIE1HSK+g3QgiDTdigXQ48GBb6ZaoBml9aZ4xbaUmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S8B7pcjp; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716816435; x=1748352435;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wvKfF7CTGkILCYXaRxLo0BRYhRmTr1qU9enaps1pCtI=;
  b=S8B7pcjpn/vYnLpnbZpyta0K6D1GEvMUuLZ5q7FHtyHWCN/g4LwzU8jT
   I8XiFRRuFx7tcTc8Z/AArcnIyEwC2Lu45R9K6vvH9zoZHEmEh31q4GXyH
   rYvL19AWULEpSeqwlW3dFKm73cc9KnU4ZfnXCUy50XMa+H56qvntOCb/W
   0NeOpCfnk203brSmBw88DXCsZuG7Uo8qkmmaCf4ZyRPgXhPbn149OA2WV
   B/inU7fUzAk/OQzYbPgHDEPBRoNey+sNouTlM0tngq2ke8dnp/2x8CThq
   EMHAcmencl4D/of/85NtYcKUZX2LuhfwfX+DG/NK7Aojsc5tECJM+8Fn3
   Q==;
X-CSE-ConnectionGUID: 9VjXVEgHTxycoXmeR3L1HA==
X-CSE-MsgGUID: wQekaMZDS26Q6ONroRgW1w==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="13360158"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; 
   d="scan'208";a="13360158"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 06:27:14 -0700
X-CSE-ConnectionGUID: /os+K9DuQBOnhPvFbYJ2mw==
X-CSE-MsgGUID: 4kE1KxpaTKW4Su4ifoDNdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; 
   d="scan'208";a="39558544"
Received: from unknown (HELO localhost) ([10.245.247.140])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 06:27:11 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Dave Hansen <dave@sr71.net>,
	Richard Purdie <rpurdie@linux.intel.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/1] leds: ss4200: Convert PCIBIOS_* return codes to errnos
Date: Mon, 27 May 2024 16:27:00 +0300
Message-Id: <20240527132700.14260-1-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

ich7_lpc_probe() uses pci_read_config_dword() that returns PCIBIOS_*
codes. The error handling code assumes incorrectly it's a normal errno
and checks for < 0. The return code is returned from the probe function
as is but probe functions should return normal errnos.

Remove < 0 from the check and convert PCIBIOS_* returns code using
pcibios_err_to_errno() into normal errno before returning it.

Fixes: a328e95b82c1 ("leds: LED driver for Intel NAS SS4200 series (v5)")
Cc: stable@vger.kernel.org
Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/leds/leds-ss4200.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-ss4200.c b/drivers/leds/leds-ss4200.c
index fcaa34706b6c..2ef9fc7371bd 100644
--- a/drivers/leds/leds-ss4200.c
+++ b/drivers/leds/leds-ss4200.c
@@ -356,8 +356,10 @@ static int ich7_lpc_probe(struct pci_dev *dev,
 
 	nas_gpio_pci_dev = dev;
 	status = pci_read_config_dword(dev, PMBASE, &g_pm_io_base);
-	if (status)
+	if (status) {
+		status = pcibios_err_to_errno(status);
 		goto out;
+	}
 	g_pm_io_base &= 0x00000ff80;
 
 	status = pci_read_config_dword(dev, GPIO_CTRL, &gc);
@@ -369,8 +371,9 @@ static int ich7_lpc_probe(struct pci_dev *dev,
 	}
 
 	status = pci_read_config_dword(dev, GPIO_BASE, &nas_gpio_io_base);
-	if (0 > status) {
+	if (status) {
 		dev_info(&dev->dev, "Unable to read GPIOBASE.\n");
+		status = pcibios_err_to_errno(status);
 		goto out;
 	}
 	dev_dbg(&dev->dev, ": GPIOBASE = 0x%08x\n", nas_gpio_io_base);
-- 
2.39.2


