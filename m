Return-Path: <linux-leds+bounces-1848-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CB42C8FF3BF
	for <lists+linux-leds@lfdr.de>; Thu,  6 Jun 2024 19:31:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D8881F2530C
	for <lists+linux-leds@lfdr.de>; Thu,  6 Jun 2024 17:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB990199229;
	Thu,  6 Jun 2024 17:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yr3RWC3a"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484961990D1;
	Thu,  6 Jun 2024 17:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717695045; cv=none; b=M0iGQ84+94hliE4f43GJQb+G6Tt209mU4R+D0XuccA4sXmNoWQIo/shCSITA04X7hGAyTsLTbMrJDkXGLwoPGsD99uBq9E82BOwAiUG+twTGY6h7GVNCrXP0dRIjCj+K6jSNG2CTPyOtVIGCtWYlXOMSbRGRN6k/dVjmJ9LClLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717695045; c=relaxed/simple;
	bh=AsNGC/SfaUzypCoArTiibGVg3sLEs0lg8sOOJXXENq0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CxL6Wd8xqyGL6IvZb1GiSJgZ53d1J0B0q8zKZRpZWu3IC3rsPUpKha+a6zWLB8WF2ukjXi7BtLd5Lt7E0SB0NL3KVnIeqdQr63/YKtdU0zD9tYsBLt+a6IRPttJwR/deM3cbjgXofp6sbkP+ftTZldCinFinFqWfKZicN5eMCOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yr3RWC3a; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717695044; x=1749231044;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AsNGC/SfaUzypCoArTiibGVg3sLEs0lg8sOOJXXENq0=;
  b=Yr3RWC3aC6mXVTXcDbl8YtWieXVcbTe8DyEo1YWsvgOgM2phTynqLg6s
   vD8bropSSG880sAYa4jgncPaRIoog3zO2HLd+GUoNog+jX6AaNmo6R0Nr
   WLtIS5gZ6W4ZBQ024YgCr0K3oTAc5SfezRTtQV58aR/2fE/A7zNSshBfd
   9mTResXDCGs5hqesGDtJx2xuzFWT/Ij63ugK2MHHs8TKW/KPeKplBvIS6
   j06qU4e28shX6rhC0phmie6RfI8sME6NjfDWVlaPXlPTIll5QGqKaE/Us
   KfmwltEVQILq0XkQEPpGuhDJGV8mySBcYcICCITGh6ZydusmK5446OrV+
   g==;
X-CSE-ConnectionGUID: RHn2DPp8TnCqHiNykmZgHQ==
X-CSE-MsgGUID: E/JXdWV+ThyS70lJplwNwg==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14192005"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="14192005"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 10:30:42 -0700
X-CSE-ConnectionGUID: H1Cw4nhbQxG5yPNRVgxCkw==
X-CSE-MsgGUID: lXdEpxSoSfKI+XyK/qWgsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="38164426"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 06 Jun 2024 10:30:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 57D9D1C9; Thu, 06 Jun 2024 20:30:39 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v1 0/6] leds: spi-byte: Cleanup, fix a leak, and make it agnostic
Date: Thu,  6 Jun 2024 20:29:17 +0300
Message-ID: <20240606173037.3091598-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up the driver, fix one leak, and make it possible to use outside
of OF systems.

Andy Shevchenko (6):
  leds: spi-byte: call of_node_put() on error path
  leds: spi-byte: Get rid of custom led_init_default_state_get()
  leds: spi-byte: Make use of device properties
  leds: spi-byte: Utilise temporary variable for struct device
  leds: spi-byte: Use devm_mutex_init() for mutex initialization
  leds: spi-byte: Move OF ID table closer to their user

 drivers/leds/Kconfig         |  1 -
 drivers/leds/leds-spi-byte.c | 63 +++++++++++++-----------------------
 2 files changed, 22 insertions(+), 42 deletions(-)

-- 
2.43.0.rc1.1336.g36b5255a03ac


