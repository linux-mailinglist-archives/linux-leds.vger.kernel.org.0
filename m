Return-Path: <linux-leds+bounces-3228-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A49079B8D6E
	for <lists+linux-leds@lfdr.de>; Fri,  1 Nov 2024 10:07:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4CAD1C20D0F
	for <lists+linux-leds@lfdr.de>; Fri,  1 Nov 2024 09:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2BA8157A46;
	Fri,  1 Nov 2024 09:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="KACk9jY1";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OBQwM93n"
X-Original-To: linux-leds@vger.kernel.org
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25DC14F121;
	Fri,  1 Nov 2024 09:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730452026; cv=none; b=HD9zdF6rmg0YnEskwgo7yOhMqel4YfG/rRNClYB9q9hRKbyBtVBdx0e9NZrYHQ26Vjt0NNGRBJRKtIQAzBkurWwEmqLbDpPnOUyqSUbrhwSwBbvIpUHM4Yl8a5updbrgy66nOTtRee1V26XmRj2t77TPwk8bVB+dY7kP5vz3iuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730452026; c=relaxed/simple;
	bh=au6DvCGi2ofQg8+cR/1MjKC1NLEquWt46MHDxvgHaik=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=aaS9sSLby11KTvckqeYEInMN4jxI3BSeP6tHHSLC+SNQl+qqzvhB0phAluQSIhi3+mxttuaVoKQ/quStTBlss96fcoYZl7zZKihCz6khsq7Z4D4UuJQn1mVIudsqz96LCNru2zzSw1hz8z5m+oxmplYy+dLHIKANYeYS0VOqU54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=KACk9jY1; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OBQwM93n; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 9C96B2540116;
	Fri,  1 Nov 2024 05:07:02 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 01 Nov 2024 05:07:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1730452022;
	 x=1730538422; bh=ptrMptqpHML6avdgCBsl/8si5BVINdgSZ3YHqn4Y0iI=; b=
	KACk9jY1rDMHXUf3M9b1lRqSeU5hqJWRSHhrxqjDELnJ9Pcaki/Q6KCBnDmyj47l
	uDiYRGBtN5tnKNnbOvNDoOkbclktrJF3cPvMtpQl3TYVh6A2b0timBzrxPcXJ1PY
	9jszSwIeok4PZHUhf834LI0t439bW3wunjKwHJlVEG/zXVO50hI+BiiI9EWyZ6HQ
	q7xgs73drUOy7x5F+H9FNmzjwvqmuS1c8ahcgFM51nGGAJ4Zux+v/HOMVyQcN+xr
	RsachJfv05cCig42slTnX42CJS8KQgTVQOKJtiiPXI+tdGzAgCvNK1V2TIFegmKQ
	q6KB17FjbKt7rf5OIVWUeQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1730452022; x=
	1730538422; bh=ptrMptqpHML6avdgCBsl/8si5BVINdgSZ3YHqn4Y0iI=; b=O
	BQwM93nmoPFnVZ4BaE2pAfq6jzEmuIugLhXd3lXil6RDU5/hayWFiTJKB0+Xoqsf
	meiiB1zS1g9KL+jA57SZOGPjpPtcIg5RA7feNKxqygmrjZmqDPOeU7+1EzTthVcF
	eeIdm3Zu0zFcqBDt2My9JXOngl9dEnSdcSmi2UubfUjOtf2DS58DcbwzRizopJds
	nWP49RfbomIViZHOk55kpr7aqB4PXgnro+wjMALPzJMK20o7TmUxzjk4EIBJwqZj
	Yx2iZVumBK17yEBMOvrKmmwgjbMK9J472N5ub2BjVhwRqCr1pfRqgyWZwbNYtjkZ
	CRxl3fAMGRwyOo0Ubkw9A==
X-ME-Sender: <xms:NZokZ86iW98lj5FIM-abECb2QId5Ksi38sQyZgWaFqPylJM90d7EFw>
    <xme:NZokZ96BJ3BRnLMMFL-Edccvv7RrwTC9ZEdQK9V_rHgWHuRhp6NTsZjhRbfd-8YnR
    sGIzt-pf4ROEzBwnjg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeklecutefuodetggdotefrodftvfcurf
    hrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffrtefo
    kffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsuc
    dlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfh
    rhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqe
    enucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedu
    geduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeduledpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtohepghhrvghgohhrhidrtghlvghmvghnthessg
    hoohhtlhhinhdrtghomhdprhgtphhtthhopehsvggsrghsthhirghnrdhhvghsshgvlhgs
    rghrthhhsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhkphesihhnthgvlhdrtghomh
    dprhgtphhtthhopegrnhguhieskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghrmhes
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehkrggsvghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehk
    rhiikheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhgvvgeskhgvrhhnvghlrdhorh
    hg
X-ME-Proxy: <xmx:NZokZ7cXiHMXW-PagXJoFLnZvqlZL1US1g3aR15iwy3Rq95Tdje55Q>
    <xmx:NZokZxLv10mVCsfL7mEYlMhcG_k4YWQJL824Rppt4vsmQrJYWpA07Q>
    <xmx:NZokZwK7lq71Hprc68vq5b8U2vzOjjz_AayCDQ5IdtAA2vBLECGTGA>
    <xmx:NZokZywI8GT5gIU9rZhkxYJ6mVNk3pBFKCwTBppl-uAMY7vju2SwaA>
    <xmx:NpokZ1BtMdVFpaLLg3jDOzf3inOOV_fgjc8Y1R-iXjORm-VD6LOCG0Ou>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id EC8F82220072; Fri,  1 Nov 2024 05:07:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 01 Nov 2024 10:06:40 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "kernel test robot" <lkp@intel.com>,
 =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, "Lee Jones" <lee@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 "Pavel Machek" <pavel@ucw.cz>, linux-leds@vger.kernel.org, soc@kernel.org,
 "Gregory Clement" <gregory.clement@bootlin.com>, arm <arm@kernel.org>,
 "Andy Shevchenko" <andy@kernel.org>, "Hans de Goede" <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Andrew Lunn" <andrew@lunn.ch>,
 "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>,
 "Rob Herring" <robh+dt@kernel.org>, "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, devicetree@vger.kernel.org
Message-Id: <98d3ab51-e7db-46b0-8268-b111e115a281@app.fastmail.com>
In-Reply-To: <202410311612.0OkxKVgC-lkp@intel.com>
References: <20241029135621.12546-3-kabel@kernel.org>
 <202410311612.0OkxKVgC-lkp@intel.com>
Subject: Re: [PATCH leds v4 02/12] leds: turris-omnia: Use command execution functions
 from the MCU driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Oct 31, 2024, at 10:01, kernel test robot wrote:
>
> kernel test robot noticed the following build warnings:

>>> drivers/leds/leds-turris-omnia.c:409:12: warning: stack frame size (2064) exceeds limit (2048) in 'omnia_leds_probe' [-Wframe-larger-than]
>      409 | static int omnia_leds_probe(struct i2c_client *client)
>          |            ^

The problem here is the i2c_client on the stack, you can't
do that:

 static int omnia_mcu_get_features(const struct i2c_client *client)
 {
+	struct i2c_client mcu_client = *client;
 	u16 reply;

I haven't looked at this in detail, but there is usually a
trivial alternative.

     Arnd

