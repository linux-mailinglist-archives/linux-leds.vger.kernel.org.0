Return-Path: <linux-leds+bounces-6592-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D15D07818
	for <lists+linux-leds@lfdr.de>; Fri, 09 Jan 2026 08:07:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8B4A130131C3
	for <lists+linux-leds@lfdr.de>; Fri,  9 Jan 2026 07:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1A522DC77E;
	Fri,  9 Jan 2026 07:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="SBvaRiiO";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="zj2R0+Kq"
X-Original-To: linux-leds@vger.kernel.org
Received: from flow-b3-smtp.messagingengine.com (flow-b3-smtp.messagingengine.com [202.12.124.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EF93FC9;
	Fri,  9 Jan 2026 07:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767942418; cv=none; b=moyyr9YSboI2lu3ssIcUB+CSSdbvb7g0WWiGDO4KuzDcnmb5XGW8rf0c1vvDoamJfA9hZrhHMazLj7USoeTG3bXCp1CQy9/SvfqV5KFQBkT0Q+aWPp/eFUFZ+rLQXEgfcvItltbnVMhDZHyfM1Sii4dkAvLTAhg6Wfvkh+3+0/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767942418; c=relaxed/simple;
	bh=thLane9WGF2DpAp0kweUs4aLbMDzqC4LoqUQN4zJ3uA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=CHAiBdCH1XEYirxAGgYf5e7VzUSTMKZ4yjl7rgtw31ndkQMMxtU3LMUMcSnYyBOCF+AZQ8XgVx7UlFQO8s/4zWUNvNNQrcrcCfiARLlY7BayD6pnAwGNKo8SwmjcZXarEvrjLCo/kD5G4U85Lv/ow8cMCcGjUQdg6n3YpTfk23Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=SBvaRiiO; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=zj2R0+Kq; arc=none smtp.client-ip=202.12.124.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.stl.internal (Postfix) with ESMTP id A0E0313007C5;
	Fri,  9 Jan 2026 02:06:55 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Fri, 09 Jan 2026 02:06:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1767942415;
	 x=1767949615; bh=0xenDXx7lDvw8yXMh2jnUM4RAGmn8OTIbAIaZ3lsI3s=; b=
	SBvaRiiOweZGVYYoIssAxkA+VovknFQRgKJBgHY6c7Pl/td7N9Gwfi2Ogl3zfN5E
	SaxwtzJPvM4WSVtbedbOTW7+p8IwhUz0KJTLP16dDB7srgZRKMCyIqVBQXA6WDKR
	kD4YP9xPrQQK3Kqovvcatndaovu8VDLEZi3lz6Y2mFh0CdN3b+UwQw2pLLFJstll
	EKBzFK2Idhs+FhR8X5XzN6Zzn9JgWNwY2sMKY5mGtyPBlc0Emxc2WgII62CLOQ6P
	NmsRj1FduexkTnTBAGpNNr0rr7tsNW89cWHNwExlJB8fRCG6rJjxoQQjt5I26fOU
	I7BmGMFhBwj1HAw/5wco4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1767942415; x=
	1767949615; bh=0xenDXx7lDvw8yXMh2jnUM4RAGmn8OTIbAIaZ3lsI3s=; b=z
	j2R0+Kq152uZfslXfadj6zOkYSTXM53/Gvjm4NOkbfUAmlgk9Jn7erNAPYPhwLQ3
	i7cXnPqLzJgaosxar+WHZ0SQJFLSGrg8uVCdwnlWb2wDS4irWquZWVRwLPhBj2qU
	A+sAstF+L7QmTfuu3nccZFbGJ0Tr7CTVHSCMAbZkxoemSLCtCfyAjvZulw3OB4dc
	SanxYS81s2WyUR8ZVQCy65BVJUQdXq7EX0xSSXbQpYkJ5uZU8vzetH5lhIMH/kgS
	TErJrb8yXtWDehOEh+S+BABiZlByqetBd4I0fLOxTHdD9dr9woiQVK85lX2tXIqM
	rplLb4uyOoHq0xvUiBflA==
X-ME-Sender: <xms:DqlgaRu_fJGBnNG2oN8aRqVVqNc_VLaWsbEI4YZ4X-qiD9_AUsOZbg>
    <xme:DqlgaVR0Qni5z9xusGlm7Eop5HeW3Chs0KZYx0pfZjJbyBzywaCfiF77AKQpGV3g7
    DU5yd_ZSd0EenaAI1WcE1nNY4fMeQaG6tAk6Ihp05l-5VCoT01MMo-N>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutdekudejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepgfeiteeffffgieegudekudekfefhfeefhfegjeeiuddtvdeludfhjeehvdegveeu
    necuffhomhgrihhnpeguthhsrdhsohenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthho
    pedvfedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepuggrnhhivghlsedtgidtfh
    drtghomhdprhgtphhtthhopehkrhiihihsiihtohhfrdhkohiilhhofihskhhisegtrghn
    ohhnihgtrghlrdgtohhmpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlih
    guvghrrdgsvgdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlvggvrdhjoh
    hnvghssehlihhnrghrohdrohhrghdprhgtphhtthhopegtohhrsggvtheslhifnhdrnhgv
    thdprhgtphhtthhopehsrghmsehrrghvnhgsohhrghdrohhrghdprhgtphhtthhopehlih
    hnuhigsehrvghmphgvlhdqphhrihhvrghtrdguvg
X-ME-Proxy: <xmx:DqlgafUtq5PUnKACPYLpae3zgBJmVU5D7JSWQ8mD0IS1a-OvYHuhLA>
    <xmx:DqlgaTR_q4s2sYu3QkkHi4iILGCAdz5E6mZiFdm8nnql9N3NdvqztQ>
    <xmx:DqlgaWE6hoT4ybEwHjODalszGkC4kmHoSpjviS6fNRPNmA00g_TWyw>
    <xmx:DqlgabRIMMNHGICrY4naZYXcQ0D_afiEPZ4snybHEIulNP-jbLyoXQ>
    <xmx:D6lgaQyok1gp3lYljhgCQQ9Jb1jcj9C7lhBmacxDzoopRWT5MUOKz7LN>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 224E8700065; Fri,  9 Jan 2026 02:06:54 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Ai76N3Tj7qwR
Date: Fri, 09 Jan 2026 08:06:33 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Rob Herring" <robh@kernel.org>, "Luka Kovacic" <luka.kovacic@sartura.hr>
Cc: linux-doc@vger.kernel.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Geert Uytterhoeven" <geert+renesas@glider.be>,
 Max.Merchel@tq-group.com, "Oleksij Rempel" <linux@rempel-privat.de>,
 "Daniel Palmer" <daniel@0x0f.com>, "Shawn Guo" <shawnguo@kernel.org>,
 "Sam Ravnborg" <sam@ravnborg.org>, krzysztof.kozlowski@canonical.com,
 pavo.banicevic@sartura.hr, "Jonathan Corbet" <corbet@lwn.net>,
 "Lee Jones" <lee.jones@linaro.org>, "Pavel Machek" <pavel@ucw.cz>,
 "Guenter Roeck" <linux@roeck-us.net>, "Jean Delvare" <jdelvare@suse.com>,
 goran.medic@sartura.hr, luka.perkov@sartura.hr,
 "Robert Marko" <robert.marko@sartura.hr>
Message-Id: <dc1826b3-3af6-42f6-9281-52917da2c9ef@app.fastmail.com>
In-Reply-To: <20260108202907.GA998297-robh@kernel.org>
References: <20210824124438.14519-1-luka.kovacic@sartura.hr>
 <20210824124438.14519-2-luka.kovacic@sartura.hr>
 <20260108202907.GA998297-robh@kernel.org>
Subject: Re: [PATCH v9 1/7] dt-bindings: Add IEI vendor prefix and IEI WT61P803 PUZZLE
 driver bindings
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Jan 8, 2026, at 21:29, Rob Herring wrote:
> On Tue, Aug 24, 2021 at 02:44:32PM +0200, Luka Kovacic wrote:
>> Add the IEI WT61P803 PUZZLE Device Tree bindings for MFD, HWMON and LED
>> drivers. A new vendor prefix is also added accordingly for
>> IEI Integration Corp.
...
> I guess working on the driver is abandoned, but we already have this 
> binding in use in armada-8040-puzzle-m801.dts. So it's either add the 
> schema or remove the nodes to fix the warnings.
>
> Or maybe the whole platform is not used and the entire .dts file can be 
> removed?

According to the manufacturer's website, the puzzle-m801 product was
phased out a year ago, along with all other rackmount appliances, so
it's unlikely that they would still work on it, but it's also recent
enough that I think it makes sense to keep the dts file around if it
can be fixed up easily.

     Arnd

