Return-Path: <linux-leds+bounces-6479-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C78CE6B08
	for <lists+linux-leds@lfdr.de>; Mon, 29 Dec 2025 13:30:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 705C730126BA
	for <lists+linux-leds@lfdr.de>; Mon, 29 Dec 2025 12:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A32330F81A;
	Mon, 29 Dec 2025 12:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VnhK5I7R"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511EC824BD;
	Mon, 29 Dec 2025 12:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767011451; cv=none; b=mIapXFDpnJ66Xfhnhry8rpIrtgN0YHsqhiQW8Q+ZC2PkeT4MteAZCgC8T8Ul37V4lsxBR/t7tS60700NkH0zfFNzhHFFxks4DFQL/KF9KzC+WM4pw1qBt7MXZfn8rKTt1w5ZO2EJsxlDwWyUvOnf/uvKJq/M/b2PMwrBMKz+JbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767011451; c=relaxed/simple;
	bh=M7VKA/2oh3QZPA/RYYsAyJtliwor3w+/3zhjYkQCQpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EY7N//MJ/qGXkeZEs2k6wW5Wt4uZHM7aB35eN0h2D8Y+Jyf7XOALD/P3u+aYp/wmSTq9SJZg8SDJlILUcJ8XHtRIX1+2RFhgJv7AIQktx+Y1ySGQgSH3AXZnuUK+sxpFuxviNr/9cjCNCVsNVqUVgfNmEOYf+4D6OHwMHnH967w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VnhK5I7R; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767011449; x=1798547449;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=M7VKA/2oh3QZPA/RYYsAyJtliwor3w+/3zhjYkQCQpA=;
  b=VnhK5I7RMdCI/ltFDWmCwUgCj56+Sg5EMaS4S0Yd757HKeJXux5M9DXL
   JJUNCgxSGv8xZmN3YjbTq9E/alN91Ugq2oJ5Y4igwOqqDywgs9WvzTg9P
   ICz9eFK4bODBHvXhemv5Nmh3hXdL8ckg9b878x1i5fufPjce+/V1yMB7g
   Jry+zMWY/M4O3+B8KC8OsQmr+aiYe/jz4uVmndAAomN2RuYXbcSI07um1
   O7EZChAtNEWErip82/G8pWZS5dCeTEgwbfpxsgYwa45pUOjpxGB8UYouh
   AENUdhitE2BKdpBYY7aKcDhCKGGlLfe6IseDc/Iw/1EZe89KlI81Pxd22
   A==;
X-CSE-ConnectionGUID: UGOUN/6YQUC+cY5//xOoRw==
X-CSE-MsgGUID: TXx75ehyRDqXA5t16uKENw==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="67822349"
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="67822349"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 04:30:48 -0800
X-CSE-ConnectionGUID: RjuvxHRkToaD5JW280Kaxw==
X-CSE-MsgGUID: CgTdBBmWSJ6koPtIlYX7rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="224402693"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.31])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 04:30:45 -0800
Date: Mon, 29 Dec 2025 14:30:43 +0200
From: Andriy Shevencho <andriy.shevchenko@linux.intel.com>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Jonathan Brophy <professorjonny98@gmail.com>,
	lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Jonathan Brophy <professor_jonny@hotmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Radoslav Tsvetkov <rtsvetkov@gradotech.eu>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: [RFC PATCH 0/2] leds: Add optional instance identifier for
 deterministic naming
Message-ID: <aVJ0c3injbP7yRIJ@smile.fi.intel.com>
References: <20251228182252.1550173-1-professorjonny98@gmail.com>
 <761d6573-3751-47fb-9b0e-8063f3cecf76@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <761d6573-3751-47fb-9b0e-8063f3cecf76@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Dec 29, 2025 at 12:16:17PM +0100, Jacek Anaszewski wrote:
> On 12/28/25 19:22, Jonathan Brophy wrote:

> > This patch series introduces an optional "led-instance" device tree property
> > to address non-deterministic LED naming when multiple LEDs share the same
> > function and color.
> > 
> > Currently, the LED core appends numerical suffixes (_1, _2, etc.) based on
> > registration order when duplicate function:color combinations exist. This
> > creates several problems:
> > 
> > 1. **Non-deterministic naming**: Registration order determines suffix values,
> >     which can change across boots due to probe ordering, async initialization,
> >     or module load order.
> > 
> > 2. **Non-semantic identifiers**: Names like "lan:green_23" provide no
> >     indication of which physical LED or subsystem they represent.
> > 
> > 3. **Breaks userspace automation**: Network management tools, LED control
> >     daemons, and hardware monitoring cannot reliably identify LEDs.
> > 
> > 4. **Ambiguous numbering**: "lan:green_23" could be mistaken for LAN port 23
> >     when it may actually be the 23rd registered LED of any port.
> > 
> > 5. **Namespace pollution**: The alternative of adding vendor-specific function
> >     names (LED_FUNCTION_LAN_PORT0, LED_FUNCTION_LAN_PORT1...) pollutes the
> >     function namespace. The instance identifier keeps standard functions clean
> >     while allowing contextual differentiation.
> > 
> > 6. **Breaks naming convention**: The _1, _2 suffix was intended only as a
> >     collision avoidance workaround, but has become the de facto standard for
> >     hardware with multiple identical LEDs.
> > 
> > **Example: 48-port network switch**
> > 
> > Current behavior (non-deterministic):
> >    /sys/class/leds/lan:green      ← Port 0? Unknown
> >    /sys/class/leds/lan:green_1    ← Could be any port
> >    /sys/class/leds/lan:green_2    ← Could be any port
> >    ...
> >    /sys/class/leds/lan:green_47   ← Could be port 1 due to probe order
> > 
> > Proposed behavior (deterministic):
> >    /sys/class/leds/lan:green:port0   ← Always port 0
> >    /sys/class/leds/lan:green:port1   ← Always port 1
> >    /sys/class/leds/lan:green:port2   ← Always port 2
> >    ...
> >    /sys/class/leds/lan:green:port47  ← Always port 47
> > 
> > **Example: Multi-domain power indicators**
> > 
> > Current behavior (non-deterministic):
> >    /sys/class/leds/power:red      ← Which power source?
> >    /sys/class/leds/power:red_1    ← Which power source?
> >    /sys/class/leds/power:red_2    ← Which power source?
> > 
> > Proposed behavior (deterministic):
> >    /sys/class/leds/power:red:mains    ← Mains power indicator
> >    /sys/class/leds/power:red:battery  ← Battery power indicator
> >    /sys/class/leds/power:red:usb      ← USB power indicator
> > 
> > **Design principles:**
> > 
> > - Backward compatible: Instance identifier is optional
> > - Extends existing convention: function:color becomes function:color:instance
> > - Follows kernel precedent: Similar to eth0/eth1, gpio0/gpio1 naming patterns
> > - Ignored with deprecated "label" property: Avoids conflicts with legacy code
> > 
> > **Alternative solutions considered:**
> > 
> > 1. function-enumerator: Only supports numbers (0, 1, 2), producing names like
> >     "lan:green-0" which are still non-semantic. The 48-port switch needs "port0"
> >     to match physical port labels.
> 
> I think that we have currently everything in place to address the issue
> you're trying to solve with this patch. Just introduce dedicated
> function like LAN_PORT, and exploit function-enumerator.

The problem as I understood not exactly in this. The reporter wants
deterministic way of the mapping between HW numbered LEDs and their respective
names. It seems it was already mentioned that current code depends on the
arbitrary probe ordering. Saying this, I now think that perhaps GPIO led driver
should somehow allocate a range of the LEDs and then enumerate them in
accordance with the DT description?

-- 
With Best Regards,
Andy Shevchenko



