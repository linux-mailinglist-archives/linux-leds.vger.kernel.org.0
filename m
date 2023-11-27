Return-Path: <linux-leds+bounces-186-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2627FA175
	for <lists+linux-leds@lfdr.de>; Mon, 27 Nov 2023 14:54:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 273181C20D27
	for <lists+linux-leds@lfdr.de>; Mon, 27 Nov 2023 13:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D86EE30343;
	Mon, 27 Nov 2023 13:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gKQfL6ZY"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B513D30341
	for <linux-leds@vger.kernel.org>; Mon, 27 Nov 2023 13:54:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C32A7C433A9;
	Mon, 27 Nov 2023 13:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1701093244;
	bh=ky2aKAKe/DTLRtU5o6/e30Zf24aqeF/l3aPJrk9lnlo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gKQfL6ZYskF0p5TNuO6zVRFZoQLAG8oNppD1T0vJTxnJhp2SCK5ZatpwvpASOwtJn
	 WXbyol5HLd9xEtKT0zNfok1ZEE3K2xCrnbO295QLctRj+PmpZeABwbpbE28rBHwLod
	 ZWQ5ryVFlDO6fkvb25d/Ou26A9R+A1+RNHmPqmVY=
Date: Mon, 27 Nov 2023 13:12:03 +0000
From: Greg KH <gregkh@linuxfoundation.org>
To: Florian Eckert <fe@dev.tdt.de>
Cc: Eckert.Florian@googlemail.com, pavel@ucw.cz, lee@kernel.org,
	kabel@kernel.org, u.kleine-koenig@pengutronix.de,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Patch v9 0/4] ledtrig-tty: add additional tty state evaluation
Message-ID: <2023112745-sector-revenge-f821@gregkh>
References: <20231127110311.3583957-1-fe@dev.tdt.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231127110311.3583957-1-fe@dev.tdt.de>

On Mon, Nov 27, 2023 at 12:03:07PM +0100, Florian Eckert wrote:
> Changes in v9:
> ==============
> - As requested, I have removed the memory leak fix patch from the previous
>   patch series v8 and have send this patch directly to the stable
>   mailinglist [10].
> - I also have removed the not needed wait for completion code path on
>   sysfs attr store and show, for the new configuration options, as
>   requested by greg k-h [11].
> - Patch v8 3/6 dropped, because the change is not correct as mentiond
>   by greg k-h [12] and this part of the code will be removed anyway
>   in this patch series.
> - Update naming of the function ledtrig_tty_waitforcompletion() to
>   ledtrig_tty_wait_for_completion() which match better with the API call
>   function wait_for_completion_timeout().
> 
> Thanks to all reviewers for the suggestions for improvement :+1: of this
> patch set.

Nice work, thanks for sticking with it:

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

