Return-Path: <linux-leds+bounces-8781-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /KP9CiODQmp88wkAu9opvQ
	(envelope-from <linux-leds+bounces-8781-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 16:37:23 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 754096DC215
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 16:37:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=LpnRAdAr;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8781-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8781-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B45A322F10C
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 14:14:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14E7A3431F8;
	Mon, 29 Jun 2026 14:14:06 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073B032470A
	for <linux-leds@vger.kernel.org>; Mon, 29 Jun 2026 14:14:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782742446; cv=none; b=q/SvfTwMVWHLLfy5WFf9cvqWG0pwcg6CY0QeBJ4NRCDHWrBJm8M2x78AiESO63REM3bsoTNXfmalW/x/vLud+GP+m+O+1AMb0Y+xha8Hh5A4x7fOZKhgyRUSNek3ZhPnRR/dxa/B6bd/HCFYhhJBnEgHgSgcWamz3/TwrM0VjH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782742446; c=relaxed/simple;
	bh=KW8IEw7h3wB+i8CqctSJ9EOR82sULfO4TolMRZgebTY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=nN7uNYEn2LI/GGbNJmRBZ4p9iykO2rJfftoBxn3hFH+MVWyE1B9TGLkIe33q5wPt2kx+71SEfDH/Jyc/UFSaFmP8KwcCLna5lAgzYlivMKdAjY2mvrMAWKgrw4/PgzwgT1xNU78xdWl+OGoyi2mkeLoyOsQMB18fn2JtTCIxlww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LpnRAdAr; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5C8D1F00A3A;
	Mon, 29 Jun 2026 14:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782742444;
	bh=zgO5KN+Wm0fBYOnN0eVfGFwzS7J9/a8+joS8PR2qCPc=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=LpnRAdArH10MJQGWXr/wG6j2DXwFTdirzD/406+NFUyUQbXTN6wN3R/qRPdCZQQ5i
	 hk2J42umaFomTMXtwg9WtzJtOH4hTttEH+oBqm3EMz5HePp/o5qyttvp5A9fHntcZy
	 xpmbtov0kvxYXdYnu4j/ti9DO1NHHOM0SwiC77g0/aNFwl9Yd8HmJ2IrUg3lsuFeSc
	 3c8CTGPI9UHo2sIkxG1pvtFItROxEiX2dIKMuoNDli44V4njcvFCYta7s3rXn1dhS3
	 SAy8smgR6UIgOmq2Pllzm+gR5WUPMV0Crx6aNdtP6ymkzIpftTWJj/T9btstZZ20uG
	 R279jDAlg25og==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id EB8DFF4007B;
	Mon, 29 Jun 2026 10:14:03 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Mon, 29 Jun 2026 10:14:03 -0400
X-ME-Sender: <xms:q31Cavxu9swq3kAsQkuSNeuj2zXC6Ex19Bw5Dfmq2Wo3YD9snwH3aA>
    <xme:q31CaiF9gmCzTohxyt3NMs9CtTDF8nwdi1pZx43hvkwCtzgMsX7aTLEp8HQI-pRPQ
    jl2TsPx2Kw44qckBhkoME5qxLskqQDr0xiR_-QENGY0Syk2cKpEHeQ>
X-ME-Proxy-Cause: dmFkZTGhgvkS1CpP06NJt7Z0WFiFnobYXvPu8VZnYgjRVToACZ1nB7j7tJxmS6PXCeKzS9
    i7v+HEi+bEtj9teiL9y8GKllTdv9BQ2GzracmUummtJaLHiVBOppWxOYoMChb2gckZHSs/
    fR+PttWq4sRibzkVgdUITvED59GSumoBpanoxANnlHO/O/YItY5Ae6idhL2flXxBhrsf9N
    RIWw+/gK91Iz2q1PGBa5mEXFFSmqWWopqwyCkVq4Bfn20i1i/b9dWQ+TyR/QdSI9iEwBMp
    QdyZaIq9gdzWuLfHtQwRh1BqipZnNLBjQhABOgXoXCeW14VgvaygoQpTEbV3E8/t03BtGD
    KoPaPvrQ069915W2LykTC9JveR8/NtGz+I+ct3mzy/lpjC3Du99eTXFHI7O/1yKX8u9PVj
    YGUqui6YX3Ys8tUQ544SWI7LtK+rFPPoaFAKOf7yiTE1/r4YgJa+P8/PJxs/gtoPytNzew
    YtEXXtqE6pYgprEm7KzsCmHfTsGKvXJR2WU3bBzzEHlhCz3QOqF+5PXP6EABtze1DixqJe
    Wv2Y/r7VosldafzF0OR9TOcjUu0kzduM4lz4Tv73skCHAg1DmFtdRzc+VuMhC7TVh3pzxe
    8r/qGzFUAj4ERyMagEJjCGni+5+KHhpAouoSxPcUqRI31kVelLCPpOcmGoOg
X-ME-Proxy: <xmx:q31CajlwIlDmxA1ae0OuNxq3mNMSUjwgf825DN51RAJsUxj_w6rXiA>
    <xmx:q31Caqg_eunFHM9yAicCEQKAbOWXpQbCQEoU3kiFjQ7I8VbnvSzGoA>
    <xmx:q31Cajdl4eV8_KYjFgZF_60Sl0vTlZtDG58g0Sv1CNmxND0tVGiLng>
    <xmx:q31CaijyiEao9EIuYHrai8JS5iSNLdWEppg5I3ldZqi0g2t-86rYBg>
    <xmx:q31CajzaNGVpNFmqMZXg8kdN_zp7q4QiX6s-AJwN3GIgWXuvNvO_qaPO>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B65C5182007E; Mon, 29 Jun 2026 10:14:03 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ApXC9W2Mc05c
Date: Mon, 29 Jun 2026 16:13:41 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>, "Lee Jones" <lee@kernel.org>
Message-Id: <356abc3a-ff85-4238-a7b6-83eea744258d@app.fastmail.com>
In-Reply-To: <20260629134613.F154B1F000E9@smtp.kernel.org>
References: <20260629130329.1291953-1-arnd@kernel.org>
 <20260629130329.1291953-7-arnd@kernel.org>
 <20260629134613.F154B1F000E9@smtp.kernel.org>
Subject: Re: [PATCH 6/6] [v5] gpiolib: turn off legacy interface by default
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.65 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8781-lists,linux-leds=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sashiko-reviews@lists.linux.dev,m:linux-input@vger.kernel.org,m:linux-leds@vger.kernel.org,m:dmitry.torokhov@gmail.com,m:lee@kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[arnd@kernel.org,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@kernel.org,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,kernel.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 754096DC215

On Mon, Jun 29, 2026, at 15:46, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential 
> issue(s) to consider:
> - [High] Drivers depending on `GPIOLIB_LEGACY` rather than selecting it 
> are rendered unselectable and silently disabled on normal builds.
> - [Low] Disabling CONFIG_GPIOLIB_LEGACY by default causes widespread 
> build failures for platforms and drivers still relying on legacy GPIO 
> functions.

That is the idea, yes: If someone adds back a new legacy user, they
will get a build failure after this patch.

>> All users of the legacy interface now select CONFIG_GPIOLIB_LEGACY,
>> so it can be turned off by default and only get built on platforms
>> that still have one unconverted driver.
>
> [Severity: High]
> Is this description entirely accurate?
>
> There appear to be drivers that use 'depends on GPIOLIB_LEGACY' rather than
> selecting it, such as MFD_AAT2870_CORE, MFD_SI476X_CORE, and
> SND_SOC_TLV320DAC33.
>
> If GPIOLIB_LEGACY defaults to 'n' without COMPILE_TEST enabled, will these
> drivers be rendered unselectable and silently disabled on normal builds?

Yes, correct. I made sure that all platforms that do use GPIO
numbers select those symbols. The three drivers listed above
can only work if a platform has a board file with the corresponding
platform data, but nothing provides si476x_platform_data or
aat2870_platform_data, and SND_SOC_TLV320DAC33 is already
a hidden Kconfig symbol and disabled for all platforms.

      Arnd

