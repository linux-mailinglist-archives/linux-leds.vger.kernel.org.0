Return-Path: <linux-leds+bounces-4316-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65066A678A1
	for <lists+linux-leds@lfdr.de>; Tue, 18 Mar 2025 17:02:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A73C71890168
	for <lists+linux-leds@lfdr.de>; Tue, 18 Mar 2025 16:02:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82A3A20D4F9;
	Tue, 18 Mar 2025 16:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bW2uinO2"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C6E1E8334;
	Tue, 18 Mar 2025 16:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742313756; cv=none; b=jDW2Uf0X1VO5cD8+PCMAIDDeQAI4zBItxiYMRIQHKhH/3AqP9SzDM7IShOZzSoT/+k6vQgb0TUvviuCCJzIYC5XuoVOcK9GXQzgQxRsyt1xriyLV1hg5FJ7sQprpthb/KrLjKugrZcUPbCe5lB8anZF2gEjr9RgxrV0DI56bTPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742313756; c=relaxed/simple;
	bh=dfmo9ocKclAv0Jn97DtWPWsXzMUgahYEcZ+x+X4fqtg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZN+7m+VIEjNtWP5pc/4O7/YlhOOKmNrDrztXSacL5ViWJGEkj/e1ReDoaz+CFjkxZvlit4bzmhGj90AcEcyzRhZxmJtsbOf+DGq1ks8pgEaxifj2gHzBPNwi5wqd28DxuvhO70lW7YaKGNNmxp/g8z29im9VbcoKYAbcgn4pP68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bW2uinO2; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742313755; x=1773849755;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=dfmo9ocKclAv0Jn97DtWPWsXzMUgahYEcZ+x+X4fqtg=;
  b=bW2uinO2oKF80P6SpduElYfO4ZXKT6sj5NmhWUYwR0D+8iM0sXQ6MAyx
   jN+B1j3mwDp6362f4ydpxs10ndY8vsNFcTTj7xkOb/wXC8cFf2dDgJoGq
   9YIg/NBUkLqrvFYSpnzfjAFy3EKA05kQpg+Trnigx09ELOpSrkPI3cbAq
   im8bszBWiwddUlOc5U6jzrTUe604jV3q6U2KpyhkX2OrIA25SON7WPSUj
   3Mt8d7R3n+0TffyjJs5r3DDmtymi0o1acyJxxelw/XAntUyKbvbIO1ebT
   dshyuLWYb2+mzgP8YW27KomebllEVEeIsi44kF1QUSyU/rRSHyNhqq1m7
   A==;
X-CSE-ConnectionGUID: sUcQ1uNaTbumjhoipeJhbg==
X-CSE-MsgGUID: CjTOxOL2TaOJ7mwB8zdqSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="60995972"
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; 
   d="scan'208";a="60995972"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 09:02:34 -0700
X-CSE-ConnectionGUID: jeXy0aHYQ5S89K9HbwcyRQ==
X-CSE-MsgGUID: nWX83bvXTlCRSt6WrHow5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; 
   d="scan'208";a="127123864"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 09:02:33 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tuZOg-00000003fki-29VA;
	Tue, 18 Mar 2025 18:02:30 +0200
Date: Tue, 18 Mar 2025 18:02:30 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pavel Machek <pavel@kernel.org>
Subject: Re: [PATCH v1 1/1] leds: core: Bail out when composed name can't fit
 the buffer
Message-ID: <Z9mZFlDN9CegMVmH@smile.fi.intel.com>
References: <20250318155126.2974905-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250318155126.2974905-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Mar 18, 2025 at 05:51:25PM +0200, Andy Shevchenko wrote:
> GCC compiler complains about snprintf() calls that may potentially cut
> the output:
> 
>  drivers/leds/led-core.c:551:78: error: ‘snprintf’ output may be truncated before the last format character [-Werror=format-truncation=]
>  drivers/leds/led-core.c:554:78: error: ‘snprintf’ output may be truncated before the last format character [-Werror=format-truncation=]
>  ...
> 
> Fix these by checking for the potential overflow. This requires
> to align all the branches to use the same callee, i.e. snprintf(),
> otherwise the code will be blown up and return different error codes
> for the different branches.

...

> -		strscpy(led_classdev_name, to_of_node(fwnode)->name,
> -			LED_MAX_NAME_SIZE);
> +		n = snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "%pfw", fwnode);

Actually this is not an equivalent, should still have that ugly
to_of_node()->name...

I'll fix it in v2.

-- 
With Best Regards,
Andy Shevchenko



