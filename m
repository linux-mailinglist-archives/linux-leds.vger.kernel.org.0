Return-Path: <linux-leds+bounces-6580-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C9FD03F0A
	for <lists+linux-leds@lfdr.de>; Thu, 08 Jan 2026 16:41:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D18173457EF4
	for <lists+linux-leds@lfdr.de>; Thu,  8 Jan 2026 15:20:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0604B4B07D6;
	Thu,  8 Jan 2026 11:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="Iwv9hrq8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XTV7vjqG"
X-Original-To: linux-leds@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D60492F14;
	Thu,  8 Jan 2026 11:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767870277; cv=none; b=WX2KVyQw0wMRTEyVeP8z6ZRiy97Y1BUVnrT4b/tBHEJ5Mol3PjF3WRbXMKEytXHBk23pPJDU4/fQnnVEfMj90/ZLWGtFcCyjJ1trUV+zk+MaFpSetqDJkHjaFSaAhAqJGwU6Wm38kFCLlLf3xlmGjKlbEpWHTd/SED25NHwSQIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767870277; c=relaxed/simple;
	bh=QLlc22KIbfYzAbBeEywRJ8VIBYX29aQwSPYL84hJjZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pmrCNdp03y1ptONE61r3gko64t4GYLv+oIR9XtNoKe58tKvmpZIGSo9ab/YRE+JuKWkmhIAyXXPDvvFrJvsEWTBKygf2EJKWyHjwQnaSQY/h5dXnz2R+HcWjCWhBrLLIrP8EOnwushmQ3FHAATgPk+ogU5gUZHlC1KN2bTrG6n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=Iwv9hrq8; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XTV7vjqG; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id C5BBFEC00DB;
	Thu,  8 Jan 2026 06:04:23 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 08 Jan 2026 06:04:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1767870263; x=1767956663; bh=GGmG5lhQld
	p0l9feTAOBwTWzeR8pLb202sDz4wlrlGI=; b=Iwv9hrq8AUmM1ZsxRB8YEPSVjt
	wKT1aTPvLVQpzdh3OwyCNSezVnZfn/B1tlTx1WKtHRKlaYZLM3q/ML07OwdtfufI
	lYbAYvBHx3ruPsLbkxOa+2FFF18aZvNbt8lgYEsi4Yfk3WL2tImWpgcc5n3kT7Ca
	KQF7PBNA4pnsWl46ghdL2z/sUMhVB/l3zGtT/SP2Ozf+pAEHL8GYw60SsRLtSz7B
	lCHp8iheaOD8XwDt9GqKBfkoNcw82L7a8Q3Mfmo57OGqSMbVhFiqwIkWVhFUHT+e
	2OpiDauCIzFpLfDsRcKAJ4eBx+5Rrmv/uMLR4qwYiI29jxRB0J2U+j0zvMYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1767870263; x=1767956663; bh=GGmG5lhQldp0l9feTAOBwTWzeR8pLb202sD
	z4wlrlGI=; b=XTV7vjqGYv95ceLYUZzsdJ67J37YQkdSh+gJfzky/rU0hCYiU2o
	XYXqAaV1LptMzafnEoOvi/xpMnoD2eZ7W9e12FRIkG4QAG1MZg1i306SNQmaIjIB
	iNTUR6i5LHHM0l4fKWpXEDepPvmfHHkXRxCRF0yK9uliFxQVQRCcLrQUtv+jZ9ED
	rEN2RsSLinzhXH3RTR+EI6msoMCs+Gn8nzJcPvcsrBLUEl1Zue8qzQ/yfYW1T4+5
	lkjt5+Yv+FoIR90of/pCB/8FCZXYalMI9/MEOjB5xeSiDyXLtFSAWghVWJtnqm31
	VMmg2H02OInVkWP0oHbhhpOxgVCSI95x95Q==
X-ME-Sender: <xms:No9faQJNp-M3WMZG-LegAP8tnSi6aRGwHgzrEizmWtpzGbynFFAjsg>
    <xme:No9fafbN-RvsOo9S-YF5LJX7Lns39FMffIiguf1IfRieYCE5vSV_tzyn8b30wU-YM
    WO1FPUcW8naVBgGdS6-M-ngpGvKxaryAqHP-ohGgmFXwHEqPw>
X-ME-Received: <xmr:No9faTiqjqWmD9AedtPvIR5OqhFvt7Oi2Wx8b0IQxEIHRj0pgyymJsrYZqVANhZpvl22hLLxvaCDD4Kw6FI8cy4UUnYQYb3N3irzig>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutdehjeekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvdevvd
    eljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrd
    gtohhmpdhnsggprhgtphhtthhopedukedpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    oheprghnughrihihrdhshhgvvhgthhgvnhhkoheslhhinhhugidrihhnthgvlhdrtghomh
    dprhgtphhtthhopeihnhgrfhhfihhtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehs
    thgrsghlvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehptghhvghlkh
    hinhesihhsphhrrghsrdhruhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhg
    vghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehkvghrnhgvlhdqthgvrghmsegrnh
    gurhhoihgurdgtohhmpdhrtghpthhtohepphgrvhgvlhesuhgtfidrtgiipdhrtghpthht
    oheplhgvvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqlhgvughsse
    hvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:No9faU6hHqNnLiQuXQeF5Eb4FbQGFLgZkjKlaQo0i7pW_ET_0xClgw>
    <xmx:No9faboKK4QUW5Q6LZR4AxtZpS98ftTZ9IqbX5twv153BMnNNLa58w>
    <xmx:No9faRj8cf2cgRss0WO7TRVKtknB3RXZY44x82yE1GmX037-gRd1qg>
    <xmx:No9faTvNOZE0dAbtufxRs4zk56Sppm2YLD5sQXJ2OphMsKk0nVk5UQ>
    <xmx:N49fabzm9BXAtr9-zZqcgdC2X3_Oqb77m2eHBwxO8EXFQdKhfqCF7NK6>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Jan 2026 06:04:22 -0500 (EST)
Date: Thu, 8 Jan 2026 12:04:14 +0100
From: Greg KH <greg@kroah.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Tiffany Yang <ynaffit@google.com>, stable@vger.kernel.org,
	pchelkin@ispras.ru, linux-kernel@vger.kernel.org,
	kernel-team@android.com, Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org
Subject: Re: [PATCH 5.10,5.15,6.1,6.6 RESEND] leds: spi-byte: Initialize
 device node before access
Message-ID: <2026010849-capricorn-backside-0a6e@gregkh>
References: <20251231004510.1732543-2-ynaffit@google.com>
 <aVe7_7Jf_FWkBhqH@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVe7_7Jf_FWkBhqH@smile.fi.intel.com>

On Fri, Jan 02, 2026 at 02:37:19PM +0200, Andy Shevchenko wrote:
> On Tue, Dec 30, 2025 at 04:45:11PM -0800, Tiffany Yang wrote:
> > Commit 7f9ab862e05c ("leds: spi-byte: Call of_node_put() on error path")
> > was merged in 6.11 and then backported to stable trees through 5.10. It
> > relocates the line that initializes the variable 'child' to a later
> > point in spi_byte_probe().
> > 
> > Versions < 6.9 do not have commit ccc35ff2fd29 ("leds: spi-byte: Use
> > devm_led_classdev_register_ext()"), which removes a line that reads a
> > property from 'child' before its new initialization point. Consequently,
> > spi_byte_probe() reads from an uninitialized device node in stable
> > kernels 6.6-5.10.
> 
> I'm wondering if in long term the easier maintenance will be with that patch
> also being backported rather than this being applied.

I agree, that might be simplest.

thanks,

greg k-h

