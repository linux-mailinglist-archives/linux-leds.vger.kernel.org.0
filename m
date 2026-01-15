Return-Path: <linux-leds+bounces-6648-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D2FD252C2
	for <lists+linux-leds@lfdr.de>; Thu, 15 Jan 2026 16:09:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7C899300C376
	for <lists+linux-leds@lfdr.de>; Thu, 15 Jan 2026 15:07:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98FD23ACA53;
	Thu, 15 Jan 2026 15:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eUlshOpc"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CD03ACA4D;
	Thu, 15 Jan 2026 15:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768489653; cv=none; b=BKbos65LqoQxd4s3qcvvK+byjJPngLgqVR7Z/qQjVJsVhDwkTTiwYV0CDcLxBqSpVMXDg8nBnPIBhlvwRJtHdJlL05gbzcXw9IcXw/YaFvWbIch7nx8XNSiKdZcNVd8+5M3SktPWplaUIRL0OorHMv0CXSr9n8x5QaREXzspALk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768489653; c=relaxed/simple;
	bh=/tXNKuKwDsOWWOgdWZndD5bd649N8f+VXmUrl8LvNVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jGK8Xtu+66TY5pOdDtWNgV0d4/fhmEgd4rxM8oFbXQpaKWaFl5oz5BLuC/UVv183JmC/yi967aL3gOc3TJDIcJprwW7bD7T72jAYXrE204myuLUyCbb249hDSJl7w5xdcqzqGKKjWXsazAf1f36CfTESbjJpA/q8+nuxAhF0vgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eUlshOpc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE919C116D0;
	Thu, 15 Jan 2026 15:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768489651;
	bh=/tXNKuKwDsOWWOgdWZndD5bd649N8f+VXmUrl8LvNVA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eUlshOpcRqBW5VZw3NY3/3PBcQ8Tz1PQdBn2xmAoXaccPnDq2cK5F6Q/dIbc/H3h8
	 FPyDSx0qQ5Inoa02LoeQ3h3QQ3wU8oJgfZmY30OO4j3HCHtXoRdshIzGNKTN2jwYbW
	 MSrPdZALkKslUJE9P9D9ESm+WUH8W3kYCK6iDK6yiZrVA8wZZ00fjaXql/YC6CT7Ju
	 KPmePmtlvTOTNdneUKbTVgi/5YX6NydlT0bLlcdh6caUwM3Kf/2HhzL1WOfbhuBO0X
	 hZvgRGwF3olkZKbUq3/ABGR/ME5jQY60SGTZMa7wAe2fA49hbKVvabY5EPfrgmDL66
	 3/EaXhoUYJWoQ==
Date: Thu, 15 Jan 2026 15:07:25 +0000
From: Lee Jones <lee@kernel.org>
To: Jonathan Brophy <Professor_jonny@hotmail.com>
Cc: Jonathan Brophy <professorjonny98@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Andriy Shevencho <andriy.shevchenko@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Radoslav Tsvetkov <rtsvetkov@gradotech.eu>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: Re: [PATCH v5 0/7] leds: Add virtual LED group driver with priority
 arbitration
Message-ID: <20260115150725.GF2842980@google.com>
References: <20251230082336.3308403-1-professorjonny98@gmail.com>
 <20260113115701.GG1902656@google.com>
 <DS0PR84MB3746D50A75BCB4DB053E008E9F8EA@DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DS0PR84MB3746D50A75BCB4DB053E008E9F8EA@DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM>

On Tue, 13 Jan 2026, Jonathan Brophy wrote:

> >>  drivers/leds/rgb/Kconfig                      |   17 +
> >>  drivers/leds/rgb/Makefile                     |    1 +
> >>  drivers/leds/rgb/leds-group-virtualcolor.c    | 3360 +++++++++++++++++
> 
> >This is an unreasonable request to ask of any reviewer.  I certainly don't have the time to go through this in any level of detail.
> 
> >--
> >Lee Jones [李琼斯]
> 
> Hi Yes it Is a big lump of code
> I will break this down into features and separate the driver in to sub 600 lines of code in a future patch.
> 
> I'm a junior coder It is easier for me to compute as a single file but yes you are correct it is daunting.
> 
> Ill finish additions and features first then send an update patch with the driver separated for ease of review in the future.
> I expect the code to split nicely into separate sections as the below layout: 
> core.c
> arbitration.c
> phys.c
> vled.c
> debugfs.c
> virtualcolor.h
> 
> Would this be a better arrangement ?

Patches should build on each other in terms of functionality, not filename.

The first patch should provide just enough functionality to be useful.

Then build it up one piece at a time.

-- 
Lee Jones [李琼斯]

