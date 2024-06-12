Return-Path: <linux-leds+bounces-1882-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B584904D35
	for <lists+linux-leds@lfdr.de>; Wed, 12 Jun 2024 09:55:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD2CAB22363
	for <lists+linux-leds@lfdr.de>; Wed, 12 Jun 2024 07:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7117C16B73F;
	Wed, 12 Jun 2024 07:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="W82+Lsoi"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6232772A;
	Wed, 12 Jun 2024 07:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718178919; cv=none; b=FDPDxY35sX57yNZMO0qcI+21rxpXcNt2CgoET3wRcqfyIYKCt35Kp2iWXjqmN3WXRt/rblC1eGnE0EbkvJOYvj7eJTSQghz5uPzQ1vREpbzjjaIJqz4HHRuWUAYFPc+Spo7ZS77bbW65txxPLd0eRZlonnxrnA7pmYF3kFd4S5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718178919; c=relaxed/simple;
	bh=kA+gK3R1K0N3WlcTK15m+Is6Wd1GEeoj6lkFDDgAOGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MJLUe6ePNkR0x578hom+x7G2Y8p2V5UIui2KuqXmiRsiTz8fIXg+Nu/vN6pEDY7BwKVaUZfM/vmYe3q/u+PImTBVZa5AM7YacN7VmpyQaC7QvtAfJ8wwZvRVa7MQKPes4SevNMlgC3/FWQmQ15G1tcHBoMU1Mba+7AmTirq7lTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=W82+Lsoi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80B61C3277B;
	Wed, 12 Jun 2024 07:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1718178919;
	bh=kA+gK3R1K0N3WlcTK15m+Is6Wd1GEeoj6lkFDDgAOGY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W82+Lsoifld1Xd0wRHjr777X5Id5PyHMOGCc1qjZuHKvHM/rGphrmsPqp37Ngyy6s
	 KYWxRjuX+xeBl5O7BXUBfCnTzs0gJkGgO6d0k5bpgdk/sra8DB1OL/MSnKZLVp8tZs
	 VYJKDLywhQdEr+1Y0DX9Bc3mdhMGwpBXbwEhgz04=
Date: Wed, 12 Jun 2024 09:55:16 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	linux-leds@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Pavel Machek <pavel@ucw.cz>, stable@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH] leds: mt6360: fix memory leak in
 mt6360_init_isnk_properties()
Message-ID: <2024061209-giddily-slander-a6db@gregkh>
References: <20240611-leds-mt6360-memleak-v1-1-93642eb5011e@gmail.com>
 <010b1c91-fbde-4b01-a92e-8c14751c7699@web.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <010b1c91-fbde-4b01-a92e-8c14751c7699@web.de>

On Tue, Jun 11, 2024 at 04:01:49PM +0200, Markus Elfring wrote:
> …
> > Add the missing calls to fwnode_handle_put(child) to avoid memory leaks
> > in the error paths.
> 
> I suggest to apply a goto chain for a while.
> https://wiki.sei.cmu.edu/confluence/display/c/MEM12-C.+Consider+using+a+goto+chain+when+leaving+a+function+on+error+when+using+and+releasing+resources
> 
> Will the application of scope-based resource management become feasible with another delay?
> https://elixir.bootlin.com/linux/v6.10-rc3/source/include/linux/cleanup.h#L8
> 
> Regards,
> Markus
> 


Hi,

This is the semi-friendly patch-bot of Greg Kroah-Hartman.

Markus, you seem to have sent a nonsensical or otherwise pointless
review comment to a patch submission on a Linux kernel developer mailing
list.  I strongly suggest that you not do this anymore.  Please do not
bother developers who are actively working to produce patches and
features with comments that, in the end, are a waste of time.

Patch submitter, please ignore Markus's suggestion; you do not need to
follow it at all.  The person/bot/AI that sent it is being ignored by
almost all Linux kernel maintainers for having a persistent pattern of
behavior of producing distracting and pointless commentary, and
inability to adapt to feedback.  Please feel free to also ignore emails
from them.

thanks,

greg k-h's patch email bot

