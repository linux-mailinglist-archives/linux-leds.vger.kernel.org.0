Return-Path: <linux-leds+bounces-2570-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E65968808
	for <lists+linux-leds@lfdr.de>; Mon,  2 Sep 2024 14:55:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3466CB26454
	for <lists+linux-leds@lfdr.de>; Mon,  2 Sep 2024 12:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D00B620126F;
	Mon,  2 Sep 2024 12:55:42 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86C3205E2E
	for <linux-leds@vger.kernel.org>; Mon,  2 Sep 2024 12:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725281742; cv=none; b=b+D4DPelhw8k05RENN4YUUEs1l2lDgHkUnWCUOcwGPhTFhg/0TYOj00stPg5HyhS2r8aM6MzIa90NT1IULBGnmQjGAk3KIcOBm/sJdq/ZNNfDEhLSD0krHMqFEL8m509/d6MOt7msXRDc4ANNXvspA97O4ymZiWeZoB8Ej6uQho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725281742; c=relaxed/simple;
	bh=DniZvBZHRPNtbRcVAhfsu2qWl48mE+nCDPxKSb4xDbg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sXkDa0uJm1EhC0VlHywWgDzbvMJ4q8qbbdv//zAk5FhaK7sfOSI1gB5PZvV0nX7cQYJQpomTO0B29KPp5z3OpRviCglYdyrscZx8RXVDasdq8OGcaKILRq6jAPJrrk7+WtVBsQvQYHgelWYiQ161nHZMmJtDB07LwkriGf+ZmgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: /aMVAsXzQAuzkHY1gDwWPg==
X-CSE-MsgGUID: JAR+17fYTvqEYDloWsNRrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="27738619"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="27738619"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 05:55:37 -0700
X-CSE-ConnectionGUID: yW609ukaQxG6TO3siCu3Gg==
X-CSE-MsgGUID: ORvfqQgLQAW6I/dFCR85nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="64571554"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 05:55:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1sl6ag-00000004Mjx-2qxL;
	Mon, 02 Sep 2024 15:55:30 +0300
Date: Mon, 2 Sep 2024 15:55:30 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>,
	arm@kernel.org, Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH leds 1/8] turris-omnia-mcu-interface.h: Move command
 execution function to global header
Message-ID: <ZtW1wuUCvQQSPBH2@smile.fi.intel.com>
References: <20240902124104.14297-1-kabel@kernel.org>
 <20240902124104.14297-2-kabel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240902124104.14297-2-kabel@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Sep 02, 2024 at 02:40:57PM +0200, Marek Behún wrote:
> Move the command execution functions from the turris-omnia-mcu platform
> driver private header to the global turris-omnia-mcu-interface.h header,
> so that they can be used by the LED driver.

...

>  #include <linux/bitfield.h>
> +#include <linux/bitops.h>

>  #include <linux/bits.h>

You may drop this one now, as guaranteed by bitops.h.

> +#include <linux/types.h>
> +#include <asm/byteorder.h>
> +#include <asm/unaligned.h>

-- 
With Best Regards,
Andy Shevchenko



