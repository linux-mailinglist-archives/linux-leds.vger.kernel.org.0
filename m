Return-Path: <linux-leds+bounces-1863-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E61C9002F3
	for <lists+linux-leds@lfdr.de>; Fri,  7 Jun 2024 14:04:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3F37282C01
	for <lists+linux-leds@lfdr.de>; Fri,  7 Jun 2024 12:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACC7318F2C9;
	Fri,  7 Jun 2024 12:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="1fmq3d+v"
X-Original-To: linux-leds@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66C21847;
	Fri,  7 Jun 2024 12:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717761835; cv=none; b=IV9SqIK150jmO5lIwztl7W17BqV1hVQrQKk6aqKSl0M2EE/3ngaYFs0suIEd3SL2tqBe82kWEfFFerT5Q6BPB3kprPldcrBHAvAs8k7sK2J0Yu3eSowEdcs6z/fIpJRfgZLc26RxfwmHCl+MDbaDnAc7vNUCnhlzZJM1X5Kiomg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717761835; c=relaxed/simple;
	bh=8RXWDjhK3t1FOsHs4nQJKMEJJnFPojVt1t45K4Yfx+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kyjfWRdoOCt8y401zW9mx4+fGy2GaA49ZOV0byQUWXyiMrLh2512s0Fufj1npPnEum9YKVfVXiH3d3jeQR5EWNGyTyK976/N/LibogOy7zYUxBQb4q7o8jYD2HCRxTldDlEF9r2I3YzGfCet1hYOFW6Ts+ONHohH9f3wsTwiEA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=1fmq3d+v; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=UispkbW6TtP1txrIUy9EHkoFg+mrkMRv4JCZa8iHpGY=; b=1f
	mq3d+vqgjfQm+rKJAprJxKkYpK1ffuwCq9Ac7DixlRuJpaH4sq4uOj5Xlm9dS2NMcq9hbTyVUU3ym
	qnZR4DAv80vmqD9m0H/q2ET4YfLcMr1l9nu2BOiUqp+oeqS9YNED8Ru6C7Ii9i09mjcTACjn0RK9v
	z7k+Oc8+NVyRIR4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sFYJv-00H7Qi-DJ; Fri, 07 Jun 2024 14:03:47 +0200
Date: Fri, 7 Jun 2024 14:03:47 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>, regressions@lists.linux.dev,
	linux-leds@vger.kernel.org, Genes Lists <lists@sapience.com>,
	Johannes =?iso-8859-1?Q?W=FCller?= <johanneswueller@gmail.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] leds: class: Revert: "If no default trigger is given,
 make hw_control trigger the default trigger"
Message-ID: <6ebdcaca-c95a-48bc-b1ca-51cc1d7a86a5@lunn.ch>
References: <20240607101847.23037-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240607101847.23037-1-hdegoede@redhat.com>

On Fri, Jun 07, 2024 at 12:18:47PM +0200, Hans de Goede wrote:
> Commit 66601a29bb23 ("leds: class: If no default trigger is given, make
> hw_control trigger the default trigger") causes ledtrig-netdev to get
> set as default trigger on various network LEDs.
> 
> This causes users to hit a pre-existing AB-BA deadlock issue in
> ledtrig-netdev between the LED-trigger locks and the rtnl mutex,
> resulting in hung tasks in kernels >= 6.9.
> 
> Solving the deadlock is non trivial, so for now revert the change to
> set the hw_control trigger as default trigger, so that ledtrig-netdev
> no longer gets activated automatically for various network LEDs.
> 
> The netdev trigger is not needed because the network LEDs are usually under
> hw-control and the netdev trigger tries to leave things that way so setting
> it as the active trigger for the LED class device is a no-op.
> 
> Fixes: 66601a29bb23 ("leds: class: If no default trigger is given, make hw_control trigger the default trigger")
> Reported-by: Genes Lists <lists@sapience.com>
> Closes: https://lore.kernel.org/all/9d189ec329cfe68ed68699f314e191a10d4b5eda.camel@sapience.com/
> Reported-by: "Johannes Wüller" <johanneswueller@gmail.com>
> Closes: https://lore.kernel.org/lkml/e441605c-eaf2-4c2d-872b-d8e541f4cf60@gmail.com/
> Cc: stable@vger.kernel.org
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I'm not sure i agree with the Closes: All this does is make it less
likely to deadlock. The deadlock is still there. But:

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

