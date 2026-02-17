Return-Path: <linux-leds+bounces-6962-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aL8RErR7lGkfFAIAu9opvQ
	(envelope-from <linux-leds+bounces-6962-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 17 Feb 2026 15:31:16 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B88CD14D2B7
	for <lists+linux-leds@lfdr.de>; Tue, 17 Feb 2026 15:31:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A54E4302EAB1
	for <lists+linux-leds@lfdr.de>; Tue, 17 Feb 2026 14:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4EB136C0D2;
	Tue, 17 Feb 2026 14:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="biGqLMoU"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D7936C585
	for <linux-leds@vger.kernel.org>; Tue, 17 Feb 2026 14:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771338613; cv=pass; b=EWa7ZV4Vs2ljZzeN7l/wxpekvNNybx4us3en2WNvZ11ULGilUbX96X6r5+qrKq6Kl92/QKjYyr9LpthizDKQK1T9swk9rCMtABqkwiuDWRVouewYD7V2B6c5S4WmzSywJmv+3r6axToaDmYmz+DcCWubZFIULXgd5nYITgmoDpQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771338613; c=relaxed/simple;
	bh=xgEp0OxlcQGQ7e2PjqAvPQDJsGSUceDoN/FTA2D933g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kfwHnJIuv02cd2rXo3oVXl6UTdN7J3j9Pa+YJ227HP9w8hgUZOV6MjLEjW3muX+nKiZTq+7FlAiUG4ZwqntPp1aI6CfcKtFxjWwEUdJtLI60dNbkLQ3npw56gVFkdB6I7J0eJXbbswlsB6BYRXf1+Ch3iV1bN4ibUXtjM3i9s8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=biGqLMoU; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-436263e31abso4135496f8f.1
        for <linux-leds@vger.kernel.org>; Tue, 17 Feb 2026 06:30:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771338610; cv=none;
        d=google.com; s=arc-20240605;
        b=BBP662q4PU9qhwbccUtZ3pk/6dUicwe9e//mfdGmRK42hrZNtBzxksBvSksk9bQylH
         3qzxB+kPaoiTpxdQQwLPeiphyA0E390qMru8aJUT4cnMfxpYxAzc1rE6g9KRo0i7zqaG
         Kyl3u2P97J62vyMS06odD6KIg7ZklwmqOeRjrjGgLdO33ZXdPyMmZXotphPlvTpyTfoe
         qn1bsca3p7/Yx3twsF3ZIC+oHo6H4KGl+SfNRl33Cn+C1MlDdvuqNzN7TXr6KewJOI+M
         6ZVkH/gUKEW5T1XkTTtzmLvfpCDD3uTUNK1usceMOHZ7gwXe2e05FLuoEX/d7qKhVKO7
         n5pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VEXatnwqoQncMhu3mEDseyvqdEZczrLmCyrd4Zj7SDE=;
        fh=3loYnWXTQWgoR6tAH5CvqcDSXnEmZ5PSByaxItGc5NQ=;
        b=eym2DR2WVZMraYA9T0TCREhY2oJPvRgJlrYDXmcKzk4k8wgoDfVcjZnTZCQVWUkJ5Z
         UliNXsboI5jggo3S4cckY+jMlgSb1IAMfaROPsIulTHQxD4q0BZ514+jrpsGbtgd09TT
         24Or3MNjfv53lvJsgtz3jQti9NdGznHTc0ioHGMenzarwD+zcaOpUo4DZURfEYeEStl9
         jt7NNO4Up7QDfYrFhaZepz8cGQchudpKSJOcB2piTDNdI3uyrCaWIrHlASgfK5vpvluj
         EK95ErowW9+y8OG2+/Up9WooEkil3Qh0UqV8e3vrKfzVdf5EPvRn40aFFLBSmZbpYQTT
         /KZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771338610; x=1771943410; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VEXatnwqoQncMhu3mEDseyvqdEZczrLmCyrd4Zj7SDE=;
        b=biGqLMoUinuXrScyEXxEfk4PfQt7PiiEuJlHjTXqzmcLuZrAhUOC7F+aTKrIu3Ro8L
         EIu/ck8AX8uYJ2jc9IuNMAacAXmwnuAcmd4O3s/0t6Pa211MTaIOutHt19aWHcq7n+GY
         TOVmNM1N8SnioBf3bIZC92PsGuLiRMyzRwk2Cv/yzA25EQN4HH2LuwEN9vESne9R4epT
         d2QXYa+AtGhwHopXPCM5YnD24xLB3fYZ/sWRb65b/6Nan4e4Wooumq+GVMSmKR3IcNC9
         B2GU2zbDox2aSRIP/cMTIaVXesmvE4k+qWrxOtu6nxuBUvisuXPplrSkbwlM13YVs6KQ
         YtEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771338610; x=1771943410;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VEXatnwqoQncMhu3mEDseyvqdEZczrLmCyrd4Zj7SDE=;
        b=vS+A52CkcpPoH8FpBmURKPziMPy0cmEIxojNXBPH+LMUlDJRS28HI8yaCu022sH4DM
         zZSguJuQQgzYwDLSGSIbLfy4xbWQzwlcg1ohk11T61IvwLcNSZ4pMXTyYdjGwcQ4g7pw
         zE2tyL2fm2BrXEF8b/Xy+2uRGvYkFYAjCoho929RMV3hblKp06aZGjEVjSIyoXOPZOqY
         EhhTUeqZfVov+uE0IORoT0Y+M5GXJ1f47AdChlIdJ993ZdPejJBdyBP6bc8vOz04NgbM
         /6cTQrf9l2iDYK+jygT4pK0jIdwjPdsmR08SDuSso3LjYSTo6dAkmFYUWZEGfwWkIUIL
         ieqQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2ni/jfwH13LVJGmNG8VeA4d/YD1sS+5mFU4inP84AmpbHQT0/hwTiULRQRxhEpb1T/1s/0vHLjmwM@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi8qXcsck2ce9+EsC6MMSYc9qU7nEe/PvQTLJN5j4Z2InSNgGF
	LHv/nWRxIZwXJcVNU49cKej08x4aW92Oo0svRr7sV2qOTf/57Gm2XStSOLlVDq0vVS6iJuFhKY+
	iWy1dssFNgvf+xKbzt1oSNRkUVLL3Uqw=
X-Gm-Gg: AZuq6aKoc7SwxAC/k4qM1OpcLEzfytDwlFR2uZ3DTmS7M9smdzv5fxgbB887nUPGics
	F543JN15PkQCB8za9fYaKoV9IpLNv+enlVLQosV6qbTrSAnoz0l1jllPMvhPFgEErqs3I8LTPyh
	irZ98kC39yCVEAnViLtOk2gXlXNWV4HhfRaksPgnoUnph3uB79DSh1YiFADIoFwa0b407zDvOXF
	NMd0yd1zs0TODpTVp1qJz5u4UExBoForYbQ4pEZ6TGzttiKprXSlwwOdVgFJpDfdf0SkiE+AfX1
	BHsaLc1c
X-Received: by 2002:a05:6000:2502:b0:436:684:b94a with SMTP id
 ffacd0b85a97d-437978c9ecamr23859985f8f.4.1771338610325; Tue, 17 Feb 2026
 06:30:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260214180959.30714-1-clamor95@gmail.com> <20260214180959.30714-2-clamor95@gmail.com>
 <20260216-sprung-scallop-de7b64bf528c@spud> <CAPVz0n06+uLCSfY_bYS9v7KJ-hXotye7ej-rze6-Q8_JAF7XVA@mail.gmail.com>
 <20260216-plunder-defense-de11cf56dd3d@spud> <CAPVz0n0-LbTUZBCaO=oN3PpPLpwAqzNo29r687pKY8NbEE9giA@mail.gmail.com>
 <20260217-vowed-botany-b1c47c7e40b8@spud> <55C30023-4175-48F2-BCB0-12EC23C48F01@gmail.com>
 <1519143e-4fc3-490d-ab8d-e65edd2c4eec@kernel.org> <81844CC9-5355-4B1D-AEBD-6DD67FB8C81B@gmail.com>
 <20260217-dig-husked-8a59b6a19aee@spud>
In-Reply-To: <20260217-dig-husked-8a59b6a19aee@spud>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 17 Feb 2026 16:29:59 +0200
X-Gm-Features: AaiRm527JrR1d9ft4Dd7Ae54Z5WSVlmOfX8realrnvc6GC-L9yzztDY8UwpAN6o
Message-ID: <CAPVz0n0u7uhL8_FQFiuB7DrnL++ecbaEKEoV7N2PgTVRBVECkw@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] dt-bindings: embedded-controller: document ASUS
 Transformer EC
To: Conor Dooley <conor@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Sebastian Reichel <sre@kernel.org>, Ion Agorria <ion@agorria.com>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6962-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,agorria.com,rere.qmqm.pl,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B88CD14D2B7
X-Rspamd-Action: no action

=D0=B2=D1=82, 17 =D0=BB=D1=8E=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 16:03 Cono=
r Dooley <conor@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Feb 17, 2026 at 01:34:01PM +0200, Svyatoslav Ryhel wrote:
> >
> >
> > 17 =D0=BB=D1=8E=D1=82=D0=BE=D0=B3=D0=BE 2026=E2=80=AF=D1=80. 13:32:26 G=
MT+02:00, Krzysztof Kozlowski <krzk@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >On 17/02/2026 12:23, Svyatoslav Ryhel wrote:
> > >>>> in other words you propose this:
> > >>>>
> > >>>> properties:
> > >>>>   compatible:
> > >>>>     oneOf:
> > >>>>       - items:
> > >>>>           - enum:
> > >>>>               - asus,sl101-ec-dock
> > >>>>               - asus,tf101-ec-dock
> > >>>>               - asus,tf101g-ec-dock
> > >>>>               - asus,tf201-ec-dock
> > >>>>               - asus,tf300t-ec-dock
> > >>>>               - asus,tf300tg-ec-dock
> > >>>>               - asus,tf300tl-ec-dock
> > >>>>               - asus,tf700t-ec-dock
> > >>>>           - const: asus,transformer-ec-dock
> > >>>>
> > >>>>       - items:
> > >>>>           - enum:
> > >>>>               - asus,p1801-t-ec-pad
> > >>>>               - asus,tf201-ec-pad
> > >>>>               - asus,tf300t-ec-pad
> > >>>>               - asus,tf300tg-ec-pad
> > >>>>               - asus,tf300tl-ec-pad
> > >>>>               - asus,tf700t-ec-pad
> > >>>>               - asus,tf600t-ec-pad
> > >>>>               - asus,tf701t-ec-pad
> > >>>>           - const: asus,transformer-ec-pad
> > >>>>
> > >>>> And in the driver add match to every single entry of enums?
> > >>>
> > >>> No, I was talking about removing the generic compatibles entirely, =
since
> > >>> they are not suitably generic to cover all devices at the point of
> > >>> addition. So like:
> > >>>
> > >>
> > >> Actually, they all can be grouped under asus,transformer-ec fallback=
 if that is needed, both pad and dock EC have the same core functions just =
different set of cells. And then in the driver each compatible will get a d=
edicated matching data. Will this work?
> > >
> > >Then what does the generic compatible express if it is not used by the=
 SW.
> > >
> > >Wrap your emails to mailing list style.
> > >
> > >>
> > >> properties:
> > >>   compatible:
> > >>       - items:
> > >>           - enum:
> > >>               - asus,p1801-t-ec-pad
> > >>               - asus,sl101-ec-dock
> > >>               - asus,tf101-ec-dock
> > >>               - asus,tf101g-ec-dock
> > >>               - asus,tf201-ec-dock
> > >>               - asus,tf201-ec-pad
> > >>               - asus,tf300t-ec-dock
> > >>               - asus,tf300t-ec-pad
> > >>               - asus,tf300tg-ec-dock
> > >>               - asus,tf300tg-ec-pad
> > >>               - asus,tf300tl-ec-dock
> > >>               - asus,tf300tl-ec-pad
> > >>               - asus,tf700t-ec-dock
> > >>               - asus,tf700t-ec-pad
> > >>               - asus,tf600t-ec-pad
> > >>               - asus,tf701t-ec-pad
> > >>           - const: asus,transformer-ec
> > >>
> > >> And them schema name will match the genetic compatible.
> > >
> > >Then what does the generic compatible express?
> > >
> >
> > Then enum it is
>
>
> Why would you do that, instead of what I posted earlier in the thread?
> If you send a flat enum with all devices listed, I'm gonna just be there
> telling you to consolidate into one device-specific fallback compatible
> per programming model.

There is no one device-specific fallback compatible! Schema describes
HARDWARE not drivers no? I will not use random device compatible from
the list as a fallback compatible for a different random unrelated
device, that is plain wrong. Discuss this with Krzysztof and come up
with something meaningful please.

