Return-Path: <linux-leds+bounces-2573-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7010D9688A5
	for <lists+linux-leds@lfdr.de>; Mon,  2 Sep 2024 15:23:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B9AB3B21F9E
	for <lists+linux-leds@lfdr.de>; Mon,  2 Sep 2024 13:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2335E200139;
	Mon,  2 Sep 2024 13:23:13 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FB218455B
	for <linux-leds@vger.kernel.org>; Mon,  2 Sep 2024 13:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725283393; cv=none; b=ZFkn4qqycR3Rb0TzaMUBCg4P180gMc8TiOk6bc4nB9dnRzYkFkzvc/PAR/50I9CfQA+xhKKMhmmat9g6IE/HMHgD6MNSTCoIUilYleakMvKiZUUzM5lkYN7+kcpbHYdCETn/09GyVacX96ulUdqov4ZK79sUZfKIP9D5ay6YvUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725283393; c=relaxed/simple;
	bh=I3GiMb238Ltwdy7JclLyE1jOrlgtiq/cfscD4zz52zU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ow9GOe9a0/iQX8VMTsQkeIcG9mE/P/pqkE/BnisPNatLuojxSg5cQQDvQRCQAHjOjdQgfN0aDT+HLCvWXE91N1tcRTJnUmxJVRHeAtWpjvpteOhaNTkhkkbAh8KjeGSfeO52QzQkUA8cm6LuwZuTqD7z73boIA0uwks2sWJlX1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: ubKWfLEjS8OZzeAo6IbWEg==
X-CSE-MsgGUID: fIEHapawQeCGDlETHr2ENQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="41363580"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="41363580"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 06:23:11 -0700
X-CSE-ConnectionGUID: u6+aIGH0SfyA1obri/uWWg==
X-CSE-MsgGUID: 5FjHlDoITn61o1HNa8vzDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="64292077"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 06:23:07 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1sl71M-00000004NaA-1diX;
	Mon, 02 Sep 2024 16:23:04 +0300
Date: Mon, 2 Sep 2024 16:23:04 +0300
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
Message-ID: <ZtW8OI6ivN_1CRUE@smile.fi.intel.com>
References: <20240902124104.14297-1-kabel@kernel.org>
 <20240902124104.14297-2-kabel@kernel.org>
 <ZtW1wuUCvQQSPBH2@smile.fi.intel.com>
 <t3fazdw4aasl4oejkfowbavgxmwvvy6du2wvcku4wmstqn7cth@pvcgwzyzwsu5>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <t3fazdw4aasl4oejkfowbavgxmwvvy6du2wvcku4wmstqn7cth@pvcgwzyzwsu5>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Sep 02, 2024 at 02:59:45PM +0200, Marek Behún wrote:
> On Mon, Sep 02, 2024 at 03:55:30PM +0300, Andy Shevchenko wrote:
> > On Mon, Sep 02, 2024 at 02:40:57PM +0200, Marek Behún wrote:

...

> > >  #include <linux/bitfield.h>
> > > +#include <linux/bitops.h>
> > 
> > >  #include <linux/bits.h>
> > 
> > You may drop this one now, as guaranteed by bitops.h.
> 
> How do I know that including bit.sh won't be ever deleted from
> bitops.h?

How do I?

Somebody should start writing documentation (and tooling?) for all this
header dependency hell we have in the Linux kernel project.

> Is there some database which symbols are supposed to be provided by
> which header, and not just randomly included from another header?

Bottom line, more explicit inclusions are fine, but here is a proverb:
"make a fool pray to God, he will break his forehead."

Means that either radical approach (none or all) is not good.

-- 
With Best Regards,
Andy Shevchenko



