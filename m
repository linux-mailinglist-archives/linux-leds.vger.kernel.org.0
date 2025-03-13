Return-Path: <linux-leds+bounces-4245-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C15A5FB3B
	for <lists+linux-leds@lfdr.de>; Thu, 13 Mar 2025 17:19:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73EE388318A
	for <lists+linux-leds@lfdr.de>; Thu, 13 Mar 2025 16:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E8252690CD;
	Thu, 13 Mar 2025 16:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MNjghZIt"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0A12690C8;
	Thu, 13 Mar 2025 16:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741882340; cv=none; b=QFh13/craXWbau0V6tFmEKIIX24CHMMoGPmlpZm+WJ/M/QQz5N5HzpbKb3lAyy43PYhiOwSX2E239OIlsBhWwg3ehjDNUPnXepxM2mxk93vhSikBgxTBuEt/hmRs+qGkDVp5nyFK5v3Oq5xNk9AD7vCWKRgvzyljIvF4uf/WzJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741882340; c=relaxed/simple;
	bh=snkvbBZaU8YvmmLF3jq2uY8g41RAjJEQT4u/EPstt5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QEgXNj4MOyKVq3JpzJvOXb32u81Q06lGouONSvRItkH8n0dVmkJpzvnElSR0YU3D8nY45wJrE5ccfaDTqO7+o87SsA2bTVzROoAQnQu40j+8/ckbdmcLB+2FFkZmWZZWdekO7rdZnicihr03yEq2UKAjz+0WR9SM3+qkbudH+fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MNjghZIt; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741882339; x=1773418339;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=snkvbBZaU8YvmmLF3jq2uY8g41RAjJEQT4u/EPstt5Y=;
  b=MNjghZItnHTDa5q1k6ocN+BiPPzq42QQErj44GdDyCQMUOTeqhPz1CI2
   LpLv5lLZg+Cd8mlVd8qhV7Lr1CiTlP68jP8Yn5WucdU1I1Fp8pbaqu88B
   2DambE6fXWfQH3Xcr78WPrKfqW+qnKvYTTDB2g5d8r0Va0QzIjMm7gnZR
   5APkmfr7+aG0KPCHK8pGrjOF1I4xwuhJPwE08HoVv5z8t8ArY2ONyLZ24
   Tl0qOA8E+uwrm+Tw+wNkHasPzxqx1KpFz2lLkdZbnK2ftFQX/gOn6zYhj
   X904LXMgBdkJYoz/raLnYmZH7gG+lzCHXK5YN6nn5hadCgGoB7lEDIMIL
   w==;
X-CSE-ConnectionGUID: Sfj0mEdOTwOq7AqDLWZC7g==
X-CSE-MsgGUID: vlYx0JArQ9yI7hkV5rchNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="68371032"
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; 
   d="scan'208";a="68371032"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 09:12:18 -0700
X-CSE-ConnectionGUID: LSwv2W0KQRq7KUSsR3HnPA==
X-CSE-MsgGUID: WnzUgJ3KSqmwsv2X6/a9YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; 
   d="scan'208";a="125626042"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 13 Mar 2025 09:12:12 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id BBC89156; Thu, 13 Mar 2025 18:12:08 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Vadim Pasternak <vadimp@nvidia.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Subject: [PATCH v1 1/1] leds: mlxcpld: Remove unused header inclusion
Date: Thu, 13 Mar 2025 18:12:06 +0200
Message-ID: <20250313161206.415160-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

acpi.h is not used by the driver. Remove it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/leds/leds-mlxcpld.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/leds/leds-mlxcpld.c b/drivers/leds/leds-mlxcpld.c
index 718f55096e90..f25f68789281 100644
--- a/drivers/leds/leds-mlxcpld.c
+++ b/drivers/leds/leds-mlxcpld.c
@@ -32,7 +32,6 @@
  * POSSIBILITY OF SUCH DAMAGE.
  */
 
-#include <linux/acpi.h>
 #include <linux/device.h>
 #include <linux/dmi.h>
 #include <linux/hwmon.h>
-- 
2.47.2


