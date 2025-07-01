Return-Path: <linux-leds+bounces-4951-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 044E4AEEEE5
	for <lists+linux-leds@lfdr.de>; Tue,  1 Jul 2025 08:37:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C6AF17DB08
	for <lists+linux-leds@lfdr.de>; Tue,  1 Jul 2025 06:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93872248F42;
	Tue,  1 Jul 2025 06:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="JTePCdHa"
X-Original-To: linux-leds@vger.kernel.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC552475CB
	for <linux-leds@vger.kernel.org>; Tue,  1 Jul 2025 06:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751351803; cv=none; b=lLnDNMIhbK31lcA56Z1uoYGrddrs6B1kxt4ZU2dQQ7pcDIiJk6Ih1Zm1dLAU3SP75aI7uHLyPTrWfDL8uyQ1YjQO5+v7vPOGsads1ypqf20bilUoHhhg7PokYJqQZC9l8DCl6UgdI7CT05Q1uSQ9dzZJrmtxF3jqL0HZCthpV3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751351803; c=relaxed/simple;
	bh=VywDf27K3L71M4Kf98oFVXebrMs8mnbA36L1XTLGLKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QZuNd9XaoErw8R4Rb5LvCncCY26g6ljcXdWGjU6LkOuO6OCW8b0b0L/Yt3LSOPxtv33IWglwarlhse4JaoaMDhZXKeX7jxD5xPMRascIpybBNLCbZ3nJSuhSjm/QJZO0KtCYA5CmvXlheaKt8fJ2PKFrXXLrIjlaN3cQ51xQ8bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=JTePCdHa; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Tue, 1 Jul 2025 08:36:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751351796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tPAg5AV/pT/GTJrKJM3LHlIB64Dxy2IMrD6gr24pbvE=;
	b=JTePCdHarHvSJqR++muMkmcaCZv0Q8SQ8yBg9hKaa49oMDYrsk6uRszb5mUGHSDbM6hYHU
	rsKNa6Bco4g7hZbr+izujqjsvL2uYGPIGfQdKutPMC1wf8h9vmnqBM0jb2MGSIfPpDAvIf
	pSENWehRvQfHo1tNg48Wxcc1nCzRydc=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Lee Jones <lee@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org
Subject: Re: (subset) [PATCH v5 03/10] media: v4l2-flash: fix flash_timeout
 comment
Message-ID: <22h24d6sfthwcjkslunc6odatsj3fhsr3n4v6we377fwqfob6j@6s4lyj4gjc6y>
References: <20250617-ov9282-flash-strobe-v5-3-9762da74d065@linux.dev>
 <175032584928.604443.15779695084855330292.b4-ty@kernel.org>
 <20250619093849.GA587864@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250619093849.GA587864@google.com>
X-Migadu-Flow: FLOW_OUT

On Thu, Jun 19, 2025 at 10:38:49AM +0100, Lee Jones wrote:
> On Thu, 19 Jun 2025, Lee Jones wrote:
> 
> > On Tue, 17 Jun 2025 09:31:37 +0200, Richard Leitner wrote:
> > > The comment for the flash_timeout setter mentioned it is the "flash
> > > duration". Fix this by changing it to "flash timeout".
> > > 
> > > 
> > 
> > Applied, thanks!
> > 
> > [03/10] media: v4l2-flash: fix flash_timeout comment
> >         commit: 6012ce6b30567aa8ec8dc5b648b7841f9f74ca7c
> 
> I fixed the erroneous subject line on application.

Thanks :-)

> 
> -- 
> Lee Jones [李琼斯]

