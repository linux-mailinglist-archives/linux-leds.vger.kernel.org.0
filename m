Return-Path: <linux-leds+bounces-4881-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD50AE7F26
	for <lists+linux-leds@lfdr.de>; Wed, 25 Jun 2025 12:25:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 994A03B0093
	for <lists+linux-leds@lfdr.de>; Wed, 25 Jun 2025 10:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73C5C29E104;
	Wed, 25 Jun 2025 10:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="TKSWrROr";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nnHV8/9+"
X-Original-To: linux-leds@vger.kernel.org
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7265E29E0F9;
	Wed, 25 Jun 2025 10:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750847115; cv=none; b=uKSciphkNylDAvRq0sT3R6w1VlLslNbk5UskkMQxbe3zrGtTi1ZoDqgWTvMbCaNVgOykM7lDTEgqcLTsaBnxR3PEG583UD4hZRKzqee7nb1WG7OuwA22HyS3ax5OtkhEV6Xw67qvNB9y9YERRjwksMz5PFYx2+gDKwo+1o51wQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750847115; c=relaxed/simple;
	bh=tG7a3ZItCYkDtdwO9iI6HZOCnoH5okvr7WUT/lZAtq8=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Ho1ra6Y4JdWmmDTeA7TL3miXFGMUibP8wp93jIE7enWvbjXKeu7DyGple69Q7VHIpeNLPmhmeEcF+ahWuhxkEJBeU4QwC6RQU+eXhdzFweZdyXoBzwd8wJZ8UDH+qh9bPCEQ8tgimHceJEq16GNfx1Uvhgaes0p62i6Ho3Klx34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=TKSWrROr; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nnHV8/9+; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 67A871D00259;
	Wed, 25 Jun 2025 06:25:12 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Wed, 25 Jun 2025 06:25:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1750847112;
	 x=1750933512; bh=TBm+Qub6RsDu5D+ba+/b8NIpVUsl38Geir+nquSffcE=; b=
	TKSWrROrmyuJfTJx2gCzQ1sdGS/860+ogYqU844UMC6rRO+2nbjwMNKiVspPN6wq
	M9aWBJ9qWfEoj1T+flqzA+5CMAGALM2LLw7nnNwhW8JPc2FQQW81M4kv+OznC2rI
	bFkOIvl4mHwZAnLlyHUd0k45MuQ4S7WIsp4bME40//NdEnRAUpFMHbtf2UZ7M7EN
	D8MGHz6FISZkWc7YR1FPXSPSdU7FWU1sB34ns9NYlYATWlaVcJxt6fiLEgv+qv8Z
	bZROGSWrXSIw79juYvJaIzn4IuC+kFj0dRZlD6pmqmIOxwBjxCO6wzpu+Z2WhfXE
	x94d2P0+V+gsMWKdyOVYPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1750847112; x=
	1750933512; bh=TBm+Qub6RsDu5D+ba+/b8NIpVUsl38Geir+nquSffcE=; b=n
	nHV8/9+rnAT1uq81n8Q6IvYckmFOzuSHSPmS5c4EJ+xeOJLnbfA1vxOxNcYH/a4Z
	Z7hNbAnV9kAX3Kz8yzyaBTeJcX+1X+q9NL3jqbVc+hSN7kI/QeNFxp33ec6ExLyY
	LqgRvaag/Vl5uwtjp4KOVUVVmJeDWgM5BNTO6BESZxOTmUvQiXxVRwQCdBEk2F7I
	5UK1SHJszJIJyo8b7G3nGzuKDtdYPhBSvWVY8z21tbLzgbnPO3Bjr0eva9BpHSJx
	SGisEjvF1PcBEHjQ0rGzKMgGrCvC1euty2uIM4jmoN6kfXBL2V0mvbhlHttTVgsX
	L7KqnEPClL4quTg/oxfiA==
X-ME-Sender: <xms:iM5baMwwpaq6xJ1CXqXXh99Ded128bDFpWuylEs0VpQMEz7c8U9OTw>
    <xme:iM5baAQrMz4T2HmCTgFb0n0wLkcnlMnGcJ1U9LscRiTeDDRjZnctNZyM721A28yem
    PoeVGZ9DCCoh9unnU0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvvdehvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopegrrhhnugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohephhgrnhhsgh
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhgvvgeskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepphgrvhgvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugi
    dqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhu
    gidqlhgvughssehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:iM5baOVAf4tWcewwNbxzi1FBon0bh5oHUlHZef58XBludzzDGHbSTQ>
    <xmx:iM5baKjLe2fB4ZgOQYE4XVCnupsjosJnJs71-pV6mRTF8ykSbERR0A>
    <xmx:iM5baOBq0vOKS-XFVkPkn0pPDJPIzFd9mfRCzfK-9_TPPRxxPPIh-g>
    <xmx:iM5baLJdAySsk1ngFoqgSEaei4tYgoyqSTSgVpS2NigLSNBLU4GBgQ>
    <xmx:iM5baGvKsBXwAPkHrS5Htztdsu9jAnO262_eBsUbfEBfUEjVOywV8NaT>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 11A61700063; Wed, 25 Jun 2025 06:25:12 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T27b2e028d13a0da5
Date: Wed, 25 Jun 2025 12:24:51 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Lee Jones" <lee@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>
Cc: "Pavel Machek" <pavel@kernel.org>, "Hans de Goede" <hansg@kernel.org>,
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <59044fff-6531-4425-8ccb-e21e17664f26@app.fastmail.com>
In-Reply-To: <20250625092450.GT795775@google.com>
References: <20250620110820.3364008-1-arnd@kernel.org>
 <20250625092450.GT795775@google.com>
Subject: Re: [PATCH] leds: trigger: ledtrig-cpu:: enforce NR_CPUS limit in Kconfig
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Jun 25, 2025, at 11:24, Lee Jones wrote:
> On Fri, 20 Jun 2025, Arnd Bergmann wrote:
>> 
>> Enforce this limit in Kconfig instead to avoid the build failure.
>
> I have so many questions!
>
> - This number seems arbitrary - what is the limiting factor?
>   - Character size for printing?

That is my best guess, yes. The original commit 8f88731d052d
("led-triggers: create a trigger for CPU activity") already
had this, plus

#define MAX_NAME_LEN 8
snprintf(trig->name, MAX_NAME_LEN, "cpu%d", cpu);

which comes out to 10000 cpus (0 through 9999) in a NUL-terminated
string. Obviously we could have a higher limit here but would
technically still need to check that.

> - What platform did you test this on to blow through that number?

I was only compile-testing with a crazy number of CPUs, to see
what would break, in particular when there are per-cpu structures
or cpumask_t variables on the stack. I sent fixes for the ones
that broke the build, but don't expect anything to actually
need this at runtime. Some of the fixes I sent also address
possible stack overflows that happen with a more realistic
number of CPUs.

> - What if we really do want 10000+ CPUs?
>   - And what will that LED array look like to support them all?

abcc131292aa ("ledtrig-cpu: Limit to 8 CPUs") actually added a
runtime limit to eight CPUS, which is probably more reasonable.

> - If we're enforcing here, is the BUILD_BUG_ON() now superfluous?

Yes, but it documents the requirement better than just the
Kconfig dependency. Since there is a runtime limit, we could
probably just drop the compile-time check and not add the
Kconfig check.

      Arnd

