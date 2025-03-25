Return-Path: <linux-leds+bounces-4362-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D7BA6EB74
	for <lists+linux-leds@lfdr.de>; Tue, 25 Mar 2025 09:24:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 215C43AE67D
	for <lists+linux-leds@lfdr.de>; Tue, 25 Mar 2025 08:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E25E149E13;
	Tue, 25 Mar 2025 08:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="EXITNn9B"
X-Original-To: linux-leds@vger.kernel.org
Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2258277104
	for <linux-leds@vger.kernel.org>; Tue, 25 Mar 2025 08:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742891069; cv=none; b=gukrvQcyzgU1noWHn8m92EDwB5dbSqrce2oP8aH9R8loogC0bOml5PdYsxazPZ5I40XitXsI+Uiggo1lw4shKi3iBvkD9+PQ7E2SJ6bDRdFbY10lCby/hmozr3iVKS+N+6dxmzdeV3bBfKiQ02WgtPra/TpZKfHfknwrxQ9HYuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742891069; c=relaxed/simple;
	bh=FmU8seJWlLLdkKs55Qcsnj5sXgB6LeuT70pLzIMMEOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T4NqonUx2uwvNOKWVlGWLgC4UuI4/I+V9PvaW8x4ugMFwZR8aoyw4FEETJawQ5Pp82MNR21yiPmGc3I0vZP8wC2k64f2xiwG5TOus1k5H+2Lsc8lPIMhA078wLQ0QqQpBwxWuWHUIAdZ5AQjCaGvDOMFmzXE51KQc2SqjrUOrzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=EXITNn9B; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Tue, 25 Mar 2025 09:24:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1742891066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XgwNxLEz0X/ci8884eXVKynUzh11eY2mVZg19zT2ddo=;
	b=EXITNn9BmJE7U2IfWJCGLchdNu8Vk4XnKw6sBz4OerhidYPGM4SuCRglSkP1GOQSAo+xS9
	fezgkas5FKRlTHQxPTaCrCmSpiTWoO9XFaan2jKsb6GQ3pU83pVNJqT7NpIzgWGNzwW/5Y
	uQWyZG+7bXhSA0MDQat+hfldN2cb084=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 4/8] Documentation: uAPI: media: add
 V4L2_CID_FLASH_DURATION
Message-ID: <p7dar3qvajkaq6y4mxahxh2g5vkxzavjjchkwvh32hhkptona2@mzgo4vf4ni7e>
References: <20250314-ov9282-flash-strobe-v2-0-14d7a281342d@linux.dev>
 <20250314-ov9282-flash-strobe-v2-4-14d7a281342d@linux.dev>
 <d14b8c18-55b9-472c-897d-3a481892b080@xs4all.nl>
 <4w7s6g32rol2ptkchczhyhgvytyeq6baqvz4h7ikurzg2tygnr@a3q7cgeagzk4>
 <0fd2cbfa-8804-456f-891d-ecd06e828bc6@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0fd2cbfa-8804-456f-891d-ecd06e828bc6@xs4all.nl>
X-Migadu-Flow: FLOW_OUT

Hi Hans, Hi Sakari,

On Fri, Mar 14, 2025 at 11:36:12AM +0100, Hans Verkuil wrote:
> On 14/03/2025 11:28, Richard Leitner wrote:
> > Hi Hans,
> > 
> > thanks for your quick feedback!
> > 
> > On Fri, Mar 14, 2025 at 10:41:04AM +0100, Hans Verkuil wrote:
> >> On 14/03/2025 09:49, Richard Leitner wrote:
> >>> Add the new strobe_duration control to v4l uAPI documentation.
> >>>
> >>> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> >>> ---
> >>>  Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst | 5 +++++
> >>>  1 file changed, 5 insertions(+)
> >>>
> >>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst
> >>> index d22c5efb806a183a3ad67ec3e6550b002a51659a..03a58ef94be7c870f55d5a9bb09503995dbfb402 100644
> >>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst
> >>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst
> >>> @@ -186,3 +186,8 @@ Flash Control IDs
> >>>      charged before strobing. LED flashes often require a cooldown period
> >>>      after strobe during which another strobe will not be possible. This
> >>>      is a read-only control.
> >>> +
> >>> +``V4L2_CID_FLASH_DURATION (integer)``
> >>> +    Duration the flash should be on when the flash LED is in flash mode
> >>> +    (V4L2_FLASH_LED_MODE_FLASH). The unit should be microseconds (µs)
> >>> +    if possible.
> >>>
> >>
> >> If this control is present, does that mean that the flash duration always have
> >> to be set manually? Or can there be an 'Auto' mode as well? And if so, how is
> >> that set?
> > 
> > To be honest I haven't thought about automatic flash duration. Is this
> > something which is required?
> 
> No idea, it was just something I was wondering about. Sakari probably knows a lot
> more about this.

Sakari, should I add something like an auto/manual flash duration
control to this series?

Personally I think as long as we have no user of such an "auto" control
it's not really necessary. Or are there any drivers doing "auto"
flash/strobe duration already?

Thanks!

regards;rl

> 
> Regards,
> 
> 	Hans
> 
> > 
> > At least for the ov9282 sensor (which I've implemented this control for
> > in this series) there is no "auto" mode AFAIK.
> > 
> > If it's required: What would be the best solution?
> > Extending V4L2_CID_FLASH_LED_MODE with a new menu option? E.g.
> > V4L2_FLASH_LED_MODE_FLASH_{MANUAL,AUTO}?
> > 
> >>
> >> Regards,
> >>
> >> 	Hans
> > 
> > Thanks!
> > Richard
> 

