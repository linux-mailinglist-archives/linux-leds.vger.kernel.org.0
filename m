Return-Path: <linux-leds+bounces-1854-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B53A18FF423
	for <lists+linux-leds@lfdr.de>; Thu,  6 Jun 2024 19:54:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52EC72894E3
	for <lists+linux-leds@lfdr.de>; Thu,  6 Jun 2024 17:54:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEBA71991BD;
	Thu,  6 Jun 2024 17:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KvGPwprp"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332252AD33;
	Thu,  6 Jun 2024 17:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717696466; cv=none; b=JJVf/AoizMNirJCNeu8LfmDxo4ZTYWXIDYjcnwlARgYbn6U5AbRG4bjpC5vJWXmIIbonYUa8o1hwsh1iQ9eOcuD8jLbWCBhX3jF5t6UGiyvcL4Baz8JNYo74HeMqh1JrdNrPYq11pYq6D88/ZSnP5UarXJ7U7F/FO9aErSvPMFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717696466; c=relaxed/simple;
	bh=YQIiTGoH/7xsWc3WunGC30RQOf4K846Ne+BcGMXwERY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hp4zS6++gqwrCTnwJ3ffX/XLsZdrW2j4vbwbvbRvytSyVeIybm2noN7UDFr6+rBcxMAx5Iv9zBOU4rjJcbgO9xL5nm2DcH75Agpd+JRkhzK0aMWdwpX93FZ8unJG8EW8uEZxxxX9pCX4mW0kluRzHLl7fVCpdgUZ5IXLbniRLqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KvGPwprp; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717696465; x=1749232465;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YQIiTGoH/7xsWc3WunGC30RQOf4K846Ne+BcGMXwERY=;
  b=KvGPwprpWQdFuDKhl0f0xTU67f8krTWeMK+BizjFHLVP6UVaXEGZpr4c
   ohAP3ReAkrJma1qFDCkSbfRXpeXowMpZWCwYmWT+7KpBZkffkQ/1kIn72
   sdojPP1FBhvpJdmXFPbHXKkY49QALNJBrHfs/tYDn7ZsRAfsbMBU343xi
   YiB1bAtOeeSOFv7a1SnQgT1NCD/l1xAR/yVtK4+4dUlZFNLS+fnFgzSwu
   xQ+g6CngO60G7Y4X4Pmd3uhG2LPLqQp69BXzD7IzH3j+I2L7UeCsaE8AE
   WB1m0MEiP5kcfWL23QMgPGUrhpxwcUC/PoN+V9+t7/6m1HncZi5weHn+K
   w==;
X-CSE-ConnectionGUID: sWzi7nAQTICMG9qLBNgFmQ==
X-CSE-MsgGUID: X9EisFG0QmiWUmaYVvzFgg==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="24960470"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="24960470"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 10:54:20 -0700
X-CSE-ConnectionGUID: AmF52hkXQXKaxGk+y+i4sA==
X-CSE-MsgGUID: 67DuAJyvT8WVcW3OJS89Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="38496504"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 10:54:17 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sFHJW-0000000EGdc-1Dv7;
	Thu, 06 Jun 2024 20:54:14 +0300
Date: Thu, 6 Jun 2024 20:54:14 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v1 1/6] leds: spi-byte: call of_node_put() on error path
Message-ID: <ZmH3xicOvz2G-wRb@smile.fi.intel.com>
References: <20240606173037.3091598-1-andriy.shevchenko@linux.intel.com>
 <20240606173037.3091598-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606173037.3091598-2-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Jun 06, 2024 at 08:29:18PM +0300, Andy Shevchenko wrote:
> Add a missing call to of_node_put(np) on error.

Oh, yeah, this might need the Fixes tag. depending if you want to backport
this fix or no hurry.

-- 
With Best Regards,
Andy Shevchenko



