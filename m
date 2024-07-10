Return-Path: <linux-leds+bounces-2227-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D0992C7A4
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jul 2024 02:28:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECD522811B9
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jul 2024 00:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0DBEA35;
	Wed, 10 Jul 2024 00:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CE0/G1q4"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5293217FD
	for <linux-leds@vger.kernel.org>; Wed, 10 Jul 2024 00:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720571280; cv=none; b=OyI+/C2ZJgSglhw4kVLD/9wU18njU+fEQ9t7uX3kwvizW3PHPRT30M2pgPwQwqy9kHMRRkBeL+9+IdHR9I/zAY8146mECTykqImCAAImSjY22UaUkUQU0XpVbnMwxOqMaxHKHFYEXCWiscTPjJ6hiAIF2mfC94Nbhd6mXZPZCW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720571280; c=relaxed/simple;
	bh=5V98psHlIuEqOq4AXc6lVzgbFxNpBibKFh4VER63RZY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=H6UORJLtt7cRkZTGld8qa5of2p+LFGKs74WQCcBfgAQA1iUa+GjGdqVg7InB+NnDnDXhgVIkA2R/k5JLD+1H1t0vQ7jCqTIy/KoM6nFdtUUi8K952HqSwIKqqjulScmhtgVe8tHXNPWkG3IGhF7zqvJ5vn+pWIzhTqEsoRbedvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CE0/G1q4; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720571277; x=1752107277;
  h=date:from:to:cc:subject:message-id;
  bh=5V98psHlIuEqOq4AXc6lVzgbFxNpBibKFh4VER63RZY=;
  b=CE0/G1q4PyR/F6mrhyDVhrxwsRhXg11UuXx2S1/Dh1c8DcEhTfh8DK1F
   Me+vRIMbeWCaZL5/LQrfpmbzK1NmrXT6YH5vzjN2V8cTBesDrI21L46oG
   HZylkshOKsX2a1dRc9AloibMg/J/NeqiJGipzksIAIbGAG2t5zrx22x9e
   O1mz82v8jM1iX60C9lMemuzrgIpSUcySvZ0gUPjaE5UDtLooifxLvg/1B
   g30E5wK+XgypSeM5PC2mhdG7KXUlttpyhmxaYOHPH6muY97aQhyKHJddq
   Nt3vprSDQuGzZ4j/upw+5RH5fkxjJYkoLB51sRG6559a3UsDsIANQnA/O
   Q==;
X-CSE-ConnectionGUID: JJJCE5f3QfWnkPJdK7GIKw==
X-CSE-MsgGUID: yqxBuX7jQSO3e8HAxpc+mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="28471532"
X-IronPort-AV: E=Sophos;i="6.09,196,1716274800"; 
   d="scan'208";a="28471532"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 17:27:57 -0700
X-CSE-ConnectionGUID: po+z2DZITTepnopzE9KQzA==
X-CSE-MsgGUID: dT9HWfUrQBqTSuEucTCzGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,196,1716274800"; 
   d="scan'208";a="48767748"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Jul 2024 17:27:55 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRLBY-000XHk-1Z;
	Wed, 10 Jul 2024 00:27:52 +0000
Date: Wed, 10 Jul 2024 08:27:01 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD REGRESSION
 b9bd590268485652b928110b5543057543b5d02b
Message-ID: <202407100858.iMcKCuDK-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
branch HEAD: b9bd590268485652b928110b5543057543b5d02b  leds: flash: leds-qcom-flash: Test the correct variable in init

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202407092320.CLSkqq2U-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202407092352.NAcaYfjI-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202407100245.4payjdih-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/leds/leds-lp5521.c:189:15: error: too many arguments provided to function-like macro invocation
drivers/leds/leds-lp5521.c:189:2: error: use of undeclared identifier 'guard'
drivers/leds/leds-lp5521.c:189:33: error: macro "guard" passed 2 arguments, but takes just 1
drivers/leds/leds-lp5521.c:189:9: error: 'guard' undeclared (first use in this function)
drivers/leds/leds-lp5523.c:192:15: error: too many arguments provided to function-like macro invocation
drivers/leds/leds-lp5523.c:192:2: error: use of undeclared identifier 'guard'
drivers/leds/leds-lp5523.c:192:33: error: macro "guard" passed 2 arguments, but takes just 1
drivers/leds/leds-lp5523.c:192:9: error: 'guard' undeclared (first use in this function)
drivers/leds/leds-lp5562.c:175:15: error: too many arguments provided to function-like macro invocation
drivers/leds/leds-lp5562.c:175:2: error: use of undeclared identifier 'guard'
drivers/leds/leds-lp5562.c:175:33: error: macro "guard" passed 2 arguments, but takes just 1
drivers/leds/leds-lp5562.c:175:9: error: 'guard' undeclared (first use in this function)
drivers/leds/leds-lp5569.c:400:15: error: too many arguments provided to function-like macro invocation
drivers/leds/leds-lp5569.c:400:2: error: use of undeclared identifier 'guard'
drivers/leds/leds-lp5569.c:400:33: error: macro "guard" passed 2 arguments, but takes just 1
drivers/leds/leds-lp5569.c:400:9: error: 'guard' undeclared (first use in this function)
drivers/leds/leds-lp55xx-common.c:276:15: error: too many arguments provided to function-like macro invocation
drivers/leds/leds-lp55xx-common.c:276:2: error: use of undeclared identifier 'guard'
drivers/leds/leds-lp55xx-common.c:276:33: error: macro "guard" passed 2 arguments, but takes just 1
drivers/leds/leds-lp55xx-common.c:276:9: error: 'guard' undeclared (first use in this function)
drivers/leds/leds-lp55xx-common.c:798:17: warning: unused variable 'ret' [-Wunused-variable]

Error/Warning ids grouped by kconfigs:

recent_errors
|-- alpha-allmodconfig
|   |-- drivers-leds-leds-lp5521.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5521.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5523.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5523.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5562.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5562.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5569.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5569.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp55xx-common.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp55xx-common.c:error:macro-guard-passed-arguments-but-takes-just
|   `-- drivers-leds-leds-lp55xx-common.c:warning:unused-variable-ret
|-- alpha-allyesconfig
|   |-- drivers-leds-leds-lp5521.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5521.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5523.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5523.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5562.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5562.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5569.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5569.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp55xx-common.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp55xx-common.c:error:macro-guard-passed-arguments-but-takes-just
|   `-- drivers-leds-leds-lp55xx-common.c:warning:unused-variable-ret
|-- arc-allmodconfig
|   |-- drivers-leds-leds-lp5521.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5521.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5523.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5523.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5562.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5562.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5569.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5569.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp55xx-common.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp55xx-common.c:error:macro-guard-passed-arguments-but-takes-just
|   `-- drivers-leds-leds-lp55xx-common.c:warning:unused-variable-ret
|-- arc-allyesconfig
|   |-- drivers-leds-leds-lp5521.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5521.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5523.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5523.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5562.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5562.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5569.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5569.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp55xx-common.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp55xx-common.c:error:macro-guard-passed-arguments-but-takes-just
|   `-- drivers-leds-leds-lp55xx-common.c:warning:unused-variable-ret
|-- arm-allmodconfig
|   |-- drivers-leds-leds-lp5521.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5521.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5523.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5523.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5562.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5562.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5569.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5569.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp55xx-common.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp55xx-common.c:error:macro-guard-passed-arguments-but-takes-just
|   `-- drivers-leds-leds-lp55xx-common.c:warning:unused-variable-ret
|-- arm-allyesconfig
|   |-- drivers-leds-leds-lp5521.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5521.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5523.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5523.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5562.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5562.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5569.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5569.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp55xx-common.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp55xx-common.c:error:macro-guard-passed-arguments-but-takes-just
|   `-- drivers-leds-leds-lp55xx-common.c:warning:unused-variable-ret
|-- arm64-allmodconfig
|   |-- drivers-leds-leds-lp5521.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   |-- drivers-leds-leds-lp5521.c:error:use-of-undeclared-identifier-guard
|   |-- drivers-leds-leds-lp5523.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   |-- drivers-leds-leds-lp5523.c:error:use-of-undeclared-identifier-guard
|   |-- drivers-leds-leds-lp5562.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   |-- drivers-leds-leds-lp5562.c:error:use-of-undeclared-identifier-guard
|   |-- drivers-leds-leds-lp5569.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   |-- drivers-leds-leds-lp5569.c:error:use-of-undeclared-identifier-guard
|   |-- drivers-leds-leds-lp55xx-common.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   `-- drivers-leds-leds-lp55xx-common.c:error:use-of-undeclared-identifier-guard
|-- arm64-randconfig-004-20240710
|   |-- drivers-leds-leds-lp5569.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5569.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp55xx-common.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp55xx-common.c:error:macro-guard-passed-arguments-but-takes-just
|   `-- drivers-leds-leds-lp55xx-common.c:warning:unused-variable-ret
|-- csky-randconfig-002-20240710
|   |-- drivers-leds-leds-lp5562.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5562.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp55xx-common.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp55xx-common.c:error:macro-guard-passed-arguments-but-takes-just
|   `-- drivers-leds-leds-lp55xx-common.c:warning:unused-variable-ret
|-- hexagon-allmodconfig
|   |-- drivers-leds-leds-lp5521.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   |-- drivers-leds-leds-lp5521.c:error:use-of-undeclared-identifier-guard
|   |-- drivers-leds-leds-lp5523.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   |-- drivers-leds-leds-lp5523.c:error:use-of-undeclared-identifier-guard
|   |-- drivers-leds-leds-lp5562.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   |-- drivers-leds-leds-lp5562.c:error:use-of-undeclared-identifier-guard
|   |-- drivers-leds-leds-lp5569.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   |-- drivers-leds-leds-lp5569.c:error:use-of-undeclared-identifier-guard
|   |-- drivers-leds-leds-lp55xx-common.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   `-- drivers-leds-leds-lp55xx-common.c:error:use-of-undeclared-identifier-guard
|-- hexagon-allyesconfig
|   |-- drivers-leds-leds-lp5521.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   |-- drivers-leds-leds-lp5521.c:error:use-of-undeclared-identifier-guard
|   |-- drivers-leds-leds-lp5523.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   |-- drivers-leds-leds-lp5523.c:error:use-of-undeclared-identifier-guard
|   |-- drivers-leds-leds-lp5562.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   |-- drivers-leds-leds-lp5562.c:error:use-of-undeclared-identifier-guard
|   |-- drivers-leds-leds-lp5569.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   |-- drivers-leds-leds-lp5569.c:error:use-of-undeclared-identifier-guard
|   |-- drivers-leds-leds-lp55xx-common.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   `-- drivers-leds-leds-lp55xx-common.c:error:use-of-undeclared-identifier-guard
|-- i386-allmodconfig
|   |-- drivers-leds-leds-lp5521.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5521.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5523.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5523.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5562.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5562.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5569.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5569.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp55xx-common.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp55xx-common.c:error:macro-guard-passed-arguments-but-takes-just
|   `-- drivers-leds-leds-lp55xx-common.c:warning:unused-variable-ret
|-- i386-allyesconfig
|   |-- drivers-leds-leds-lp5521.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5521.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5523.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5523.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5562.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5562.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5569.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5569.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp55xx-common.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp55xx-common.c:error:macro-guard-passed-arguments-but-takes-just
|   `-- drivers-leds-leds-lp55xx-common.c:warning:unused-variable-ret
|-- i386-buildonly-randconfig-002-20240709
|   |-- drivers-leds-leds-lp5521.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5521.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5523.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5523.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp55xx-common.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp55xx-common.c:error:macro-guard-passed-arguments-but-takes-just
|   `-- drivers-leds-leds-lp55xx-common.c:warning:unused-variable-ret
|-- i386-randconfig-003-20240709
|   |-- drivers-leds-leds-lp55xx-common.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp55xx-common.c:error:macro-guard-passed-arguments-but-takes-just
|   `-- drivers-leds-leds-lp55xx-common.c:warning:unused-variable-ret
|-- i386-randconfig-005-20240709
|   |-- drivers-leds-leds-lp5521.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5521.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5523.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5523.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5562.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5562.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp55xx-common.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp55xx-common.c:error:macro-guard-passed-arguments-but-takes-just
|   `-- drivers-leds-leds-lp55xx-common.c:warning:unused-variable-ret
|-- i386-randconfig-013-20240709
|   |-- drivers-leds-leds-lp5523.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5523.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5562.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5562.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp55xx-common.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp55xx-common.c:error:macro-guard-passed-arguments-but-takes-just
|   `-- drivers-leds-leds-lp55xx-common.c:warning:unused-variable-ret
|-- i386-randconfig-014-20240709
|   |-- drivers-leds-leds-lp5521.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   |-- drivers-leds-leds-lp5521.c:error:use-of-undeclared-identifier-guard
|   |-- drivers-leds-leds-lp5562.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   |-- drivers-leds-leds-lp5562.c:error:use-of-undeclared-identifier-guard
|   |-- drivers-leds-leds-lp55xx-common.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   `-- drivers-leds-leds-lp55xx-common.c:error:use-of-undeclared-identifier-guard
|-- i386-randconfig-141-20240710
|   |-- drivers-leds-leds-lp5521.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   |-- drivers-leds-leds-lp5521.c:error:use-of-undeclared-identifier-guard
|   |-- drivers-leds-leds-lp5562.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   |-- drivers-leds-leds-lp5562.c:error:use-of-undeclared-identifier-guard
|   |-- drivers-leds-leds-lp55xx-common.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   `-- drivers-leds-leds-lp55xx-common.c:error:use-of-undeclared-identifier-guard
|-- loongarch-allyesconfig
|   |-- drivers-leds-leds-lp5521.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5521.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5523.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5523.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5562.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5562.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5569.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5569.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp55xx-common.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp55xx-common.c:error:macro-guard-passed-arguments-but-takes-just
|   `-- drivers-leds-leds-lp55xx-common.c:warning:unused-variable-ret
|-- m68k-allmodconfig
|   |-- drivers-leds-leds-lp5521.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5521.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5523.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5523.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5562.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5562.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5569.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5569.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp55xx-common.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp55xx-common.c:error:macro-guard-passed-arguments-but-takes-just
|   `-- drivers-leds-leds-lp55xx-common.c:warning:unused-variable-ret
|-- m68k-allyesconfig
|   |-- drivers-leds-leds-lp5521.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5521.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5523.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5523.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5562.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5562.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5569.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5569.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp55xx-common.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp55xx-common.c:error:macro-guard-passed-arguments-but-takes-just
|   `-- drivers-leds-leds-lp55xx-common.c:warning:unused-variable-ret
|-- microblaze-allyesconfig
|   |-- drivers-leds-leds-lp5521.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5521.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5523.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5523.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5562.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5562.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5569.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5569.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp55xx-common.c:error:guard-undeclared-(first-use-in-this-function)
|   `-- drivers-leds-leds-lp55xx-common.c:error:macro-guard-passed-arguments-but-takes-just
|-- mips-allmodconfig
|   |-- drivers-leds-leds-lp5521.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5521.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5523.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5523.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5562.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5562.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5569.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5569.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp55xx-common.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp55xx-common.c:error:macro-guard-passed-arguments-but-takes-just
|   `-- drivers-leds-leds-lp55xx-common.c:warning:unused-variable-ret
|-- mips-allyesconfig
|   |-- drivers-leds-leds-lp5521.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5521.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5523.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5523.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5562.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5562.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5569.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5569.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp55xx-common.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp55xx-common.c:error:macro-guard-passed-arguments-but-takes-just
|   `-- drivers-leds-leds-lp55xx-common.c:warning:unused-variable-ret
|-- nios2-randconfig-001-20240710
|   |-- drivers-leds-leds-lp5523.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5523.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5569.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5569.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp55xx-common.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp55xx-common.c:error:macro-guard-passed-arguments-but-takes-just
|   `-- drivers-leds-leds-lp55xx-common.c:warning:unused-variable-ret
|-- openrisc-allyesconfig
|   |-- drivers-leds-leds-lp5521.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5521.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5523.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5523.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5562.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5562.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5569.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5569.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp55xx-common.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp55xx-common.c:error:macro-guard-passed-arguments-but-takes-just
|   `-- drivers-leds-leds-lp55xx-common.c:warning:unused-variable-ret
|-- parisc-allmodconfig
|   |-- drivers-leds-leds-lp5521.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5521.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5523.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5523.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5562.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5562.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5569.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5569.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp55xx-common.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp55xx-common.c:error:macro-guard-passed-arguments-but-takes-just
|   `-- drivers-leds-leds-lp55xx-common.c:warning:unused-variable-ret
|-- parisc-allyesconfig
|   |-- drivers-leds-leds-lp5521.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5521.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5523.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5523.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5562.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5562.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5569.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5569.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp55xx-common.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp55xx-common.c:error:macro-guard-passed-arguments-but-takes-just
|   `-- drivers-leds-leds-lp55xx-common.c:warning:unused-variable-ret
|-- powerpc-allmodconfig
|   |-- drivers-leds-leds-lp5521.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5521.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5523.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5523.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5562.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5562.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5569.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5569.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp55xx-common.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp55xx-common.c:error:macro-guard-passed-arguments-but-takes-just
|   `-- drivers-leds-leds-lp55xx-common.c:warning:unused-variable-ret
|-- powerpc-allyesconfig
|   |-- drivers-leds-leds-lp5521.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   |-- drivers-leds-leds-lp5521.c:error:use-of-undeclared-identifier-guard
|   |-- drivers-leds-leds-lp5523.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   |-- drivers-leds-leds-lp5523.c:error:use-of-undeclared-identifier-guard
|   |-- drivers-leds-leds-lp5562.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   |-- drivers-leds-leds-lp5562.c:error:use-of-undeclared-identifier-guard
|   |-- drivers-leds-leds-lp5569.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   |-- drivers-leds-leds-lp5569.c:error:use-of-undeclared-identifier-guard
|   |-- drivers-leds-leds-lp55xx-common.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   `-- drivers-leds-leds-lp55xx-common.c:error:use-of-undeclared-identifier-guard
|-- powerpc-randconfig-001-20240710
|   |-- drivers-leds-leds-lp5521.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5521.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5523.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5523.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5562.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5562.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5569.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5569.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp55xx-common.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp55xx-common.c:error:macro-guard-passed-arguments-but-takes-just
|   `-- drivers-leds-leds-lp55xx-common.c:warning:unused-variable-ret
|-- powerpc64-randconfig-001-20240710
|   |-- drivers-leds-leds-lp5521.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5521.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5523.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5523.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5562.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5562.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5569.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5569.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp55xx-common.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp55xx-common.c:error:macro-guard-passed-arguments-but-takes-just
|   `-- drivers-leds-leds-lp55xx-common.c:warning:unused-variable-ret
|-- powerpc64-randconfig-002-20240710
|   |-- drivers-leds-leds-lp5521.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   |-- drivers-leds-leds-lp5521.c:error:use-of-undeclared-identifier-guard
|   |-- drivers-leds-leds-lp5523.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   |-- drivers-leds-leds-lp5523.c:error:use-of-undeclared-identifier-guard
|   |-- drivers-leds-leds-lp5562.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   |-- drivers-leds-leds-lp5562.c:error:use-of-undeclared-identifier-guard
|   |-- drivers-leds-leds-lp5569.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   |-- drivers-leds-leds-lp5569.c:error:use-of-undeclared-identifier-guard
|   |-- drivers-leds-leds-lp55xx-common.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   `-- drivers-leds-leds-lp55xx-common.c:error:use-of-undeclared-identifier-guard
|-- powerpc64-randconfig-003-20240710
|   |-- drivers-leds-leds-lp5521.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   |-- drivers-leds-leds-lp5521.c:error:use-of-undeclared-identifier-guard
|   |-- drivers-leds-leds-lp5523.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   |-- drivers-leds-leds-lp5523.c:error:use-of-undeclared-identifier-guard
|   |-- drivers-leds-leds-lp5562.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   |-- drivers-leds-leds-lp5562.c:error:use-of-undeclared-identifier-guard
|   |-- drivers-leds-leds-lp55xx-common.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   `-- drivers-leds-leds-lp55xx-common.c:error:use-of-undeclared-identifier-guard
|-- riscv-allmodconfig
|   |-- drivers-leds-leds-lp5521.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   |-- drivers-leds-leds-lp5521.c:error:use-of-undeclared-identifier-guard
|   |-- drivers-leds-leds-lp5523.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   |-- drivers-leds-leds-lp5523.c:error:use-of-undeclared-identifier-guard
|   |-- drivers-leds-leds-lp5562.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   |-- drivers-leds-leds-lp5562.c:error:use-of-undeclared-identifier-guard
|   |-- drivers-leds-leds-lp5569.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   |-- drivers-leds-leds-lp5569.c:error:use-of-undeclared-identifier-guard
|   |-- drivers-leds-leds-lp55xx-common.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   `-- drivers-leds-leds-lp55xx-common.c:error:use-of-undeclared-identifier-guard
|-- riscv-allyesconfig
|   |-- drivers-leds-leds-lp5521.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   |-- drivers-leds-leds-lp5521.c:error:use-of-undeclared-identifier-guard
|   |-- drivers-leds-leds-lp5523.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   |-- drivers-leds-leds-lp5523.c:error:use-of-undeclared-identifier-guard
|   |-- drivers-leds-leds-lp5562.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   |-- drivers-leds-leds-lp5562.c:error:use-of-undeclared-identifier-guard
|   |-- drivers-leds-leds-lp5569.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   |-- drivers-leds-leds-lp5569.c:error:use-of-undeclared-identifier-guard
|   |-- drivers-leds-leds-lp55xx-common.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   `-- drivers-leds-leds-lp55xx-common.c:error:use-of-undeclared-identifier-guard
|-- riscv-randconfig-001-20240710
|   |-- drivers-leds-leds-lp5521.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   |-- drivers-leds-leds-lp5521.c:error:use-of-undeclared-identifier-guard
|   |-- drivers-leds-leds-lp5523.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   |-- drivers-leds-leds-lp5523.c:error:use-of-undeclared-identifier-guard
|   |-- drivers-leds-leds-lp5569.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   |-- drivers-leds-leds-lp5569.c:error:use-of-undeclared-identifier-guard
|   |-- drivers-leds-leds-lp55xx-common.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   `-- drivers-leds-leds-lp55xx-common.c:error:use-of-undeclared-identifier-guard
|-- s390-allmodconfig
|   |-- drivers-leds-leds-lp5521.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   |-- drivers-leds-leds-lp5521.c:error:use-of-undeclared-identifier-guard
|   |-- drivers-leds-leds-lp5523.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   |-- drivers-leds-leds-lp5523.c:error:use-of-undeclared-identifier-guard
|   |-- drivers-leds-leds-lp5562.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   |-- drivers-leds-leds-lp5562.c:error:use-of-undeclared-identifier-guard
|   |-- drivers-leds-leds-lp5569.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   |-- drivers-leds-leds-lp5569.c:error:use-of-undeclared-identifier-guard
|   |-- drivers-leds-leds-lp55xx-common.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   `-- drivers-leds-leds-lp55xx-common.c:error:use-of-undeclared-identifier-guard
|-- s390-allyesconfig
|   |-- drivers-leds-leds-lp5521.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5521.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5523.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5523.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5562.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5562.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5569.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5569.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp55xx-common.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp55xx-common.c:error:macro-guard-passed-arguments-but-takes-just
|   `-- drivers-leds-leds-lp55xx-common.c:warning:unused-variable-ret
|-- sh-allmodconfig
|   |-- drivers-leds-leds-lp5521.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5521.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5523.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5523.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5562.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5562.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5569.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5569.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp55xx-common.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp55xx-common.c:error:macro-guard-passed-arguments-but-takes-just
|   `-- drivers-leds-leds-lp55xx-common.c:warning:unused-variable-ret
|-- sh-allyesconfig
|   `-- drivers-leds-leds-lp55xx-common.c:warning:unused-variable-ret
|-- sh-randconfig-001-20240710
|   |-- drivers-leds-leds-lp5521.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5521.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5523.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5523.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5562.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5562.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5569.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5569.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp55xx-common.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp55xx-common.c:error:macro-guard-passed-arguments-but-takes-just
|   `-- drivers-leds-leds-lp55xx-common.c:warning:unused-variable-ret
|-- sparc-allyesconfig
|   |-- drivers-leds-leds-lp5521.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5521.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5523.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5523.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5562.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5562.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5569.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5569.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp55xx-common.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp55xx-common.c:error:macro-guard-passed-arguments-but-takes-just
|   `-- drivers-leds-leds-lp55xx-common.c:warning:unused-variable-ret
|-- sparc-randconfig-002-20240710
|   |-- drivers-leds-leds-lp5521.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5521.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5523.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5523.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5562.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5562.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5569.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5569.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp55xx-common.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp55xx-common.c:error:macro-guard-passed-arguments-but-takes-just
|   `-- drivers-leds-leds-lp55xx-common.c:warning:unused-variable-ret
|-- sparc64-randconfig-001-20240710
|   |-- drivers-leds-leds-lp5523.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5523.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5569.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5569.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp55xx-common.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp55xx-common.c:error:macro-guard-passed-arguments-but-takes-just
|   `-- drivers-leds-leds-lp55xx-common.c:warning:unused-variable-ret
|-- um-allmodconfig
|   |-- drivers-leds-leds-lp5521.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   |-- drivers-leds-leds-lp5521.c:error:use-of-undeclared-identifier-guard
|   |-- drivers-leds-leds-lp5523.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   |-- drivers-leds-leds-lp5523.c:error:use-of-undeclared-identifier-guard
|   |-- drivers-leds-leds-lp5562.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   |-- drivers-leds-leds-lp5562.c:error:use-of-undeclared-identifier-guard
|   |-- drivers-leds-leds-lp5569.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   |-- drivers-leds-leds-lp5569.c:error:use-of-undeclared-identifier-guard
|   |-- drivers-leds-leds-lp55xx-common.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   `-- drivers-leds-leds-lp55xx-common.c:error:use-of-undeclared-identifier-guard
|-- um-allyesconfig
|   |-- drivers-leds-leds-lp5521.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5521.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5523.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5523.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5562.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5562.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5569.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5569.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp55xx-common.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp55xx-common.c:error:macro-guard-passed-arguments-but-takes-just
|   `-- drivers-leds-leds-lp55xx-common.c:warning:unused-variable-ret
|-- x86_64-buildonly-randconfig-002-20240710
|   |-- drivers-leds-leds-lp5523.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   |-- drivers-leds-leds-lp5523.c:error:use-of-undeclared-identifier-guard
|   |-- drivers-leds-leds-lp5562.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   |-- drivers-leds-leds-lp5562.c:error:use-of-undeclared-identifier-guard
|   |-- drivers-leds-leds-lp55xx-common.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   `-- drivers-leds-leds-lp55xx-common.c:error:use-of-undeclared-identifier-guard
|-- x86_64-randconfig-002-20240710
|   |-- drivers-leds-leds-lp5521.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   |-- drivers-leds-leds-lp5521.c:error:use-of-undeclared-identifier-guard
|   |-- drivers-leds-leds-lp5523.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   |-- drivers-leds-leds-lp5523.c:error:use-of-undeclared-identifier-guard
|   |-- drivers-leds-leds-lp5562.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   |-- drivers-leds-leds-lp5562.c:error:use-of-undeclared-identifier-guard
|   |-- drivers-leds-leds-lp55xx-common.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   `-- drivers-leds-leds-lp55xx-common.c:error:use-of-undeclared-identifier-guard
|-- x86_64-randconfig-004-20240710
|   |-- drivers-leds-leds-lp5521.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   |-- drivers-leds-leds-lp5521.c:error:use-of-undeclared-identifier-guard
|   |-- drivers-leds-leds-lp5523.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   |-- drivers-leds-leds-lp5523.c:error:use-of-undeclared-identifier-guard
|   |-- drivers-leds-leds-lp55xx-common.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   `-- drivers-leds-leds-lp55xx-common.c:error:use-of-undeclared-identifier-guard
|-- x86_64-randconfig-005-20240710
|   |-- drivers-leds-leds-lp5562.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   |-- drivers-leds-leds-lp5562.c:error:use-of-undeclared-identifier-guard
|   |-- drivers-leds-leds-lp55xx-common.c:error:too-many-arguments-provided-to-function-like-macro-invocation
|   `-- drivers-leds-leds-lp55xx-common.c:error:use-of-undeclared-identifier-guard
|-- xtensa-allyesconfig
|   |-- drivers-leds-leds-lp5521.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5521.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5523.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5523.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5562.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5562.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5569.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5569.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp55xx-common.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp55xx-common.c:error:macro-guard-passed-arguments-but-takes-just
|   `-- drivers-leds-leds-lp55xx-common.c:warning:unused-variable-ret
|-- xtensa-randconfig-001-20240710
|   |-- drivers-leds-leds-lp5521.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5521.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5523.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5523.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5562.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5562.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp5569.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp5569.c:error:macro-guard-passed-arguments-but-takes-just
|   |-- drivers-leds-leds-lp55xx-common.c:error:guard-undeclared-(first-use-in-this-function)
|   |-- drivers-leds-leds-lp55xx-common.c:error:macro-guard-passed-arguments-but-takes-just
|   `-- drivers-leds-leds-lp55xx-common.c:warning:unused-variable-ret
`-- xtensa-randconfig-002-20240710
    |-- drivers-leds-leds-lp5521.c:error:guard-undeclared-(first-use-in-this-function)
    |-- drivers-leds-leds-lp5521.c:error:macro-guard-passed-arguments-but-takes-just
    |-- drivers-leds-leds-lp5562.c:error:guard-undeclared-(first-use-in-this-function)
    |-- drivers-leds-leds-lp5562.c:error:macro-guard-passed-arguments-but-takes-just
    |-- drivers-leds-leds-lp5569.c:error:guard-undeclared-(first-use-in-this-function)
    |-- drivers-leds-leds-lp5569.c:error:macro-guard-passed-arguments-but-takes-just
    |-- drivers-leds-leds-lp55xx-common.c:error:guard-undeclared-(first-use-in-this-function)
    |-- drivers-leds-leds-lp55xx-common.c:error:macro-guard-passed-arguments-but-takes-just
    `-- drivers-leds-leds-lp55xx-common.c:warning:unused-variable-ret

elapsed time: 867m

configs tested: 133
configs skipped: 3

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                   randconfig-001-20240710   gcc-13.2.0
arc                   randconfig-002-20240710   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   clang-19
arm                              allyesconfig   gcc-13.2.0
arm                     davinci_all_defconfig   clang-19
arm                          ep93xx_defconfig   clang-14
arm                   randconfig-001-20240710   clang-19
arm                   randconfig-002-20240710   gcc-13.2.0
arm                   randconfig-003-20240710   clang-19
arm                   randconfig-004-20240710   gcc-13.2.0
arm                    vt8500_v6_v7_defconfig   gcc-13.2.0
arm64                            allmodconfig   clang-19
arm64                             allnoconfig   gcc-13.2.0
arm64                 randconfig-001-20240710   clang-19
arm64                 randconfig-002-20240710   clang-19
arm64                 randconfig-003-20240710   clang-17
arm64                 randconfig-004-20240710   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                  randconfig-001-20240710   gcc-13.2.0
csky                  randconfig-002-20240710   gcc-13.2.0
hexagon                          allmodconfig   clang-19
hexagon                           allnoconfig   clang-19
hexagon                          allyesconfig   clang-19
hexagon               randconfig-001-20240710   clang-19
hexagon               randconfig-002-20240710   clang-19
i386                             allmodconfig   gcc-13
i386                              allnoconfig   gcc-13
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240709   gcc-11
i386         buildonly-randconfig-002-20240709   gcc-13
i386         buildonly-randconfig-003-20240709   clang-18
i386         buildonly-randconfig-004-20240709   clang-18
i386         buildonly-randconfig-005-20240709   clang-18
i386         buildonly-randconfig-006-20240709   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240709   gcc-13
i386                  randconfig-002-20240709   clang-18
i386                  randconfig-003-20240709   gcc-11
i386                  randconfig-004-20240709   gcc-13
i386                  randconfig-005-20240709   gcc-13
i386                  randconfig-006-20240709   gcc-13
i386                  randconfig-011-20240709   clang-18
i386                  randconfig-012-20240709   gcc-13
i386                  randconfig-013-20240709   gcc-12
i386                  randconfig-014-20240709   clang-18
i386                  randconfig-015-20240709   clang-18
i386                  randconfig-016-20240709   gcc-10
loongarch                        allmodconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                 loongson3_defconfig   gcc-13.2.0
loongarch             randconfig-001-20240710   gcc-13.2.0
loongarch             randconfig-002-20240710   gcc-13.2.0
m68k                             allmodconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-13.2.0
m68k                       m5275evb_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                     decstation_defconfig   gcc-13.2.0
mips                        maltaup_defconfig   clang-19
nios2                         3c120_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                 randconfig-001-20240710   gcc-13.2.0
nios2                 randconfig-002-20240710   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                         allyesconfig   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
parisc                           allmodconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                           allyesconfig   gcc-13.2.0
parisc                randconfig-001-20240710   gcc-13.2.0
parisc                randconfig-002-20240710   gcc-13.2.0
powerpc                          allmodconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc                          allyesconfig   clang-19
powerpc                      bamboo_defconfig   clang-19
powerpc                     mpc5200_defconfig   clang-14
powerpc               randconfig-001-20240710   gcc-13.2.0
powerpc               randconfig-002-20240710   clang-19
powerpc               randconfig-003-20240710   gcc-13.2.0
powerpc64             randconfig-001-20240710   gcc-13.2.0
powerpc64             randconfig-002-20240710   clang-15
powerpc64             randconfig-003-20240710   clang-19
riscv                            allmodconfig   clang-19
riscv                             allnoconfig   gcc-13.2.0
riscv                            allyesconfig   clang-19
riscv                 randconfig-001-20240710   clang-19
riscv                 randconfig-002-20240710   clang-19
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                             allyesconfig   gcc-13.2.0
s390                  randconfig-001-20240710   gcc-13.2.0
s390                  randconfig-002-20240710   gcc-13.2.0
sh                               allmodconfig   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-13.2.0
sh                    randconfig-001-20240710   gcc-13.2.0
sh                    randconfig-002-20240710   gcc-13.2.0
sparc                            allmodconfig   gcc-13.2.0
sparc64               randconfig-001-20240710   gcc-13.2.0
sparc64               randconfig-002-20240710   gcc-13.2.0
um                               allmodconfig   clang-19
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-13
um                    randconfig-001-20240710   gcc-13
um                    randconfig-002-20240710   clang-19
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240710   clang-18
x86_64       buildonly-randconfig-002-20240710   clang-18
x86_64       buildonly-randconfig-003-20240710   clang-18
x86_64       buildonly-randconfig-004-20240710   clang-18
x86_64       buildonly-randconfig-005-20240710   gcc-13
x86_64       buildonly-randconfig-006-20240710   clang-18
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240710   gcc-13
x86_64                randconfig-002-20240710   clang-18
x86_64                randconfig-003-20240710   gcc-12
x86_64                randconfig-004-20240710   clang-18
x86_64                randconfig-005-20240710   clang-18
x86_64                randconfig-006-20240710   gcc-13
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240710   gcc-13.2.0
xtensa                randconfig-002-20240710   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

