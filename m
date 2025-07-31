Return-Path: <linux-leds+bounces-5178-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF62FB16FCD
	for <lists+linux-leds@lfdr.de>; Thu, 31 Jul 2025 12:47:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0AD005473FC
	for <lists+linux-leds@lfdr.de>; Thu, 31 Jul 2025 10:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 960572264AC;
	Thu, 31 Jul 2025 10:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="qIN3qzqy"
X-Original-To: linux-leds@vger.kernel.org
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B40C22E3E8
	for <linux-leds@vger.kernel.org>; Thu, 31 Jul 2025 10:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753958875; cv=none; b=PfaC6ulvox7/PqTRcuo26sGyF8ZwG0J28sagjOMrvPLSRwKD72A9D6G3XUb7olRMhBql4JJxW8g08Lp41aXog0WhArOOES0UO9i/GtoDEcSUfFqqrjxd7cuoY5kCx/vx+TTFuDbcqWQkqxp6S53+sRrQGukNmWAtmNbIXscvxTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753958875; c=relaxed/simple;
	bh=2JOs8JbCsum8xwijma+QwLKZoL2qTSgFarQTf7xvGJE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=RHx5lERaV02XYFC8D4jy5HykL635cBoow9wJXWZlLASfYKPC1djB2FuUDX2rsV6RY24yc5g1begM5w9W5IUrh6TPZUKD4hrtWXmZI/99eJvlEZBi+lv22XabU06ZFNfF4II1QQn8BFRzPO9dRaE0In12KC30/6ulAIvBRcJaH04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=qIN3qzqy; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1753958869;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4odthgpL669trIYuGSc79a2PbDMDTzqM0a0YUOGgrG4=;
	b=qIN3qzqyLEa3z9iZDs4OBiMyEkwfOUm9Rgo0ugEyNNN9bQxGrV7mMmEe7UJSpU2oEYInKA
	kXO5MgJsKXAsjT/ZVYgAxzSdHgrLstMXufy/zJIML0jm1K5GcgSCskrDrRb1VPkibOvLqX
	yQhgIv7EQHp3NYwluIZ2zZ40zpaT0sYyEEoeQkqEfwB3jG4nuJDmd9BNp2PnTkkXn/aTq8
	mD49PYVQmnTWzczEcBPucD9wKrC+VJzmCo0/J6NFqq9x4FvnWon/5NljRHsntow0ithW7Q
	Gi/6M3de/t7h9ADLPGf5p2lYEQ2U8QFdPaK0Ew6QE8v9wQyJswlZbZroRG48Vw==
Content-Type: multipart/signed;
 boundary=0b38981bb829eebfafe48a04f99efa1bdb4b30b7bde156f6b84f4be44d26;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 31 Jul 2025 12:47:31 +0200
Message-Id: <DBQ6ISOKV0XR.22W3OAALUKIHQ@cknow.org>
Cc: "Lee Jones" <lee@kernel.org>, "Pavel Machek" <pavel@kernel.org>, "Andrew
 Lunn" <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>, <linux-leds@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: BUG: Circular locking dependency on netdev led trigger on
 NanoPi R5S
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Dragan Simic" <dsimic@manjaro.org>, "Robin Murphy"
 <robin.murphy@arm.com>
References: <DBLBPIBKFCJV.36AVW8JY88L7H@cknow.org>
 <6817efe1-f2c2-4686-bdf1-fca11f066e3a@arm.com>
 <475ee9ae8cdca5ce86b708fe0ade7c9d@manjaro.org>
In-Reply-To: <475ee9ae8cdca5ce86b708fe0ade7c9d@manjaro.org>
X-Migadu-Flow: FLOW_OUT

--0b38981bb829eebfafe48a04f99efa1bdb4b30b7bde156f6b84f4be44d26
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Jul 30, 2025 at 9:50 PM CEST, Dragan Simic wrote:
> I've spent some time digging through the LED subsystem, which I'm
> already somewhat familiar with, and I think I've narrowed down the
> root cause of this deadlock.
>
> I'll send a preliminary patch soon, after I make sure that the root
> cause is identified correctly, and I hope Diederik will be willing
> to test the patch.  If so, and if the patch checks out to be the
> cure, I'll prepare and submit a proper patch, of course.

Sure, but AFAIC you can send it to the ML(s) directly as well.
Please do CC me as I'm only subscribed to the linux-rockchip ML.

Cheers,
  Diederik

--0b38981bb829eebfafe48a04f99efa1bdb4b30b7bde156f6b84f4be44d26
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaItJxQAKCRDXblvOeH7b
bi5gAQCxYSZt1DjQ/NWu1cowGv/jz0IMEd2jlu0r9jnSjHLQuAEAo0Kmyapy/Pgp
ro+OUyTrc2A4aBmU2frzWFW+zmcZtAc=
=jZT0
-----END PGP SIGNATURE-----

--0b38981bb829eebfafe48a04f99efa1bdb4b30b7bde156f6b84f4be44d26--

