Return-Path: <linux-leds+bounces-2588-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD05969EEE
	for <lists+linux-leds@lfdr.de>; Tue,  3 Sep 2024 15:21:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFB291C23C56
	for <lists+linux-leds@lfdr.de>; Tue,  3 Sep 2024 13:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC33B1CA68B;
	Tue,  3 Sep 2024 13:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="CxfvmrV2";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TyM2PDfF"
X-Original-To: linux-leds@vger.kernel.org
Received: from pfhigh1-smtp.messagingengine.com (fhigh1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDF41CA6BB
	for <linux-leds@vger.kernel.org>; Tue,  3 Sep 2024 13:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725369709; cv=none; b=IBpFXHXd0qHZ0zLOi2WST+6CYmsq7I7AU1zJ7NKKAsZnwecPg67z+he+7ax2mmzlAXxzee+lH4y9PxFhWYAod/0mZXBoCS98BIG1+avdBDwafYs0ZJ499gRDay8m4jJ7QBAeHoS9HM6ZUbtsUscvGbwH/KUQ3aG6gfKfYbMnq10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725369709; c=relaxed/simple;
	bh=VooIdgPkcfbeXLEKmR7gh7hcB8KhFEbjlleLHPkRcqI=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=UxLPzFuNzZdhvWyn8Lm9b4wLxGxOngW47tsXXZlZEHICDtgvwjkRQb6vAOK4CWEngJb5CWUBbUjfkkPKfsFqU1hqHwMBXquCLKpwa81Z0jDXt6r7/dAxxhsWwTIag4mT5jKs5NJ1uuCXRtSGpgQyUz61VQIEBPup1VoSPAdJ0Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=CxfvmrV2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TyM2PDfF; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C406D1140227;
	Tue,  3 Sep 2024 09:21:46 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-04.internal (MEProxy); Tue, 03 Sep 2024 09:21:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1725369706;
	 x=1725456106; bh=6uAg9vdYou7CPE1C/iTNIR5JX9ARrPpI3BYjJuX3CTQ=; b=
	CxfvmrV2scOeCBa+R/XV5lhFzS0KctzvlnqO6wT7o8GiayG4pFvhEcQXoSx/1B1x
	hurRrqKVjAm9CHao7LI9+UW0wnCDw4CNtYTcuMQcJqSQwOUnpVEi+11Dq/OSUMYs
	41P5ptEkmCt/fejpXkqdcob2rY30MFoW5PKWBv6jfJSNAqtPEa84QSFhBQnVHuce
	txuahYPLccvjaYvfmacmUHZ0t/8KWOYaivySqtSKVC19btH//N3RLc2XELqN3aiC
	o0xAltMWY/TE8a58Av/jrn6EjOzWLP8NnRLw1JnD52Avm1BdEj0sVnnG7W3Xq+69
	6IJkKMVsrFB90dtJrtvm1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725369706; x=
	1725456106; bh=6uAg9vdYou7CPE1C/iTNIR5JX9ARrPpI3BYjJuX3CTQ=; b=T
	yM2PDfFGKzG9MECFSzd1DLJPkSiYjmgmfBTs2bZA9HbYViKwp18xfB7ItpSOT//w
	sY2Fuc/oWsktrJ1ts6uygxU85jSdqXN26fQXBYQqfVA3DTslrDv2cbHGTDqMBYjA
	+eWVoXRqBdx+W7H/7TwEOz9magM+idGiUgJrhtioibxhFtzfne2M0RU3OPkwhQm4
	DT18iAbWQK+8qB56ZBTiFsUq0ZALCCERS+3wGrNFfetp4RnyU4EZSmZfcKmwZKKJ
	yUBpZITI+5XocqqRqdRS+HmEaHcNG1BdC2uvMHqCzjCPww02h+rMh48etOxCXzQf
	9Lo0lmCoI0yB1AaG+ec+A==
X-ME-Sender: <xms:ag3XZk9xlec1MNjqXNyjFRHYPel7qR2UtFv2s3OaMuU04NIhbVe83A>
    <xme:ag3XZstUOB2pXp64a3lYxFDD4RrUsJBU1ZAM2ydcC5VV3ctM5JQIqFVqKyOgISroq
    9KufEftpM3Pg7f0jnw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudehhedgieefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdeg
    jedvfeehtdeggeevheefleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepuddv
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehgrhgvghhorhihrdgtlhgvmhgvnh
    htsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepshgvsggrshhtihgrnhdrhhgvshhs
    vghlsggrrhhthhesghhmrghilhdrtghomhdprhgtphhtthhopegrnhguhieskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheprghrmheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    khgrsggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhgvvgeskhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepshhotgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepihhl
    phhordhjrghrvhhinhgvnheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhope
    grnhgurhgvfieslhhunhhnrdgthh
X-ME-Proxy: <xmx:ag3XZqDUrjlzIYiIPzU7AiP7mZKKJRi_uPl4WpTiqRiwWGXwaPooFA>
    <xmx:ag3XZke026oHq9pL-JmBLdkkQJwchi69dvPcUikcJx6BAR6D4f-t2Q>
    <xmx:ag3XZpNQOyM8491IcMyp-OJ-W-t2W1W1rNwxm2aAD0SMjvUjsJfhmQ>
    <xmx:ag3XZun8D40sPTs8FEcOJY9VLsio50aO82ebjE1Mqg1I3bZ9mCdNQA>
    <xmx:ag3XZukbMymzv_WXBwnbzdEUoKzYnF1rIckiyrQSzae62kNFGKVKX29a>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4F4902220083; Tue,  3 Sep 2024 09:21:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 03 Sep 2024 15:21:15 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 "Lee Jones" <lee@kernel.org>
Cc: "Pavel Machek" <pavel@ucw.cz>, linux-leds@vger.kernel.org, soc@kernel.org,
 "Gregory Clement" <gregory.clement@bootlin.com>, arm <arm@kernel.org>,
 "Andy Shevchenko" <andy@kernel.org>, "Hans de Goede" <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Andrew Lunn" <andrew@lunn.ch>,
 "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>
Message-Id: <fce1d0ed-d7e3-401a-9132-0b5c1571398c@app.fastmail.com>
In-Reply-To: <20240903101930.16251-11-kabel@kernel.org>
References: <20240903101930.16251-1-kabel@kernel.org>
 <20240903101930.16251-11-kabel@kernel.org>
Subject: Re: [PATCH leds v2 10/11] leds: turris-omnia: Use 100 columns in the rest of
 the code
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 3, 2024, at 12:19, Marek Beh=C3=BAn wrote:
> There are 7 more places in the code where the 100 column limit can be
> used to make the code more uniform. Do it.
>
> Signed-off-by: Marek Beh=C3=BAn <kabel@kernel.org>

I feel like it's ok to use either 80-character or 100-character line
lengths in a file, but I don't see much value in changing from one to
another here, maybe just drop this patch.

       Arnd

