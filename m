Return-Path: <linux-leds+bounces-3273-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9499BBE0B
	for <lists+linux-leds@lfdr.de>; Mon,  4 Nov 2024 20:32:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A6131F228A8
	for <lists+linux-leds@lfdr.de>; Mon,  4 Nov 2024 19:32:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB33E18DF72;
	Mon,  4 Nov 2024 19:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="RAxAd5bW"
X-Original-To: linux-leds@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC7A16C687;
	Mon,  4 Nov 2024 19:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730748768; cv=none; b=F8YISUdd3n04KuN5DHkXm/+dlFcqHS925dxDmEPzWvuu1nAoCx+Hx9dJaWknST3PaC78DjvC+QF/39+/7Brj6es0zU2U4ep+qBCM19HpXq6UQnkGqwI3MoE1MfEtsmi08Odbz0/SXuZDiNhbATrXsqm3ZnaLdMCOzYU0qssqlhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730748768; c=relaxed/simple;
	bh=AnlJQfrupn6FvoafR4Zvg3xNveOWoeF3ieOZV1PCOXw=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XWcvO7T7g17+6fzvREVFr9J0P+6mtM/w9d97OIFE3IfDh7DUSOq3SOxWS38Fwpx9A3VY4ETjqXU1FwLjBSggNdioPqTBPz0qCgQFWveAwVKfB+DhVo1QQbM+vFL8twO0iz+QI1CZXJcazOKLq9F2OKEsvT/iImytj7LRbNMJoLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=RAxAd5bW; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0CB5D42C34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1730748766; bh=v39q6CdXJe1D6nvNCUTO80fQdLURHEO63YNLYeKCSxE=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=RAxAd5bWrBUIuCG29XSTEuW40dKOdTBymTGr/tVksFcyf48tTXgZgpCUZenh0OrjS
	 gYLt2DX/kDNIkIV6B4MHsg+kado+Uw4nHITTFvBahnzpopfcaGcKl6exuBRmzkXfUs
	 6LL+iBLWVt9vgwk4EgzUl8zGP7RBkN5dePibp5EGuohZWi9PuhiAkNNcPzcynPWEAp
	 pJT5RGPvYT3D5K7T0E3V7aA+ecFAKBLM4/IJJ0MYSUpovFzAEC4lgWJZSHdXmn2Cal
	 im481E68dzcMhcWUsYZfAi1QOd1J9DzSwRw6qx9paL5ejZmQUCJ/H+SRWa9XANYRG9
	 55yn1QfYC40rw==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 0CB5D42C34;
	Mon,  4 Nov 2024 19:32:45 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>,
 rdunlap@infradead.org, pavel@ucw.cz, lee@kernel.org,
 linux-leds@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] Documentation:leds: Add leds-st1202.rst
In-Reply-To: <ZyKulcUCW3kk1AYX@admins-Air>
References: <Zx0BKtXo55D_pCGk@admins-Air>
 <0ae13ad4-342a-48ca-bd7a-8f15f6d99504@infradead.org>
 <ZyKulcUCW3kk1AYX@admins-Air>
Date: Mon, 04 Nov 2024 12:32:45 -0700
Message-ID: <875xp294ma.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk> writes:

> Hi Randy,
> Thanks for the review. Addressed all comments.
>
> Signed-off-by: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
> ---
>
> Changes in v2: Implement review comments
>
>  Documentation/leds/leds-st1202.rst | 36 ++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/leds/leds-st1202.rst

This is a new file, so you need to add it to index.rst in that
directory.

Also, please post followup patches in their own thread (not as a reply)
and include the full changelog text.

Thanks,

jon

