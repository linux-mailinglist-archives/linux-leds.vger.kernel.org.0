Return-Path: <linux-leds+bounces-7800-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCTSAShu6GkSKQIAu9opvQ
	(envelope-from <linux-leds+bounces-7800-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 22 Apr 2026 08:43:52 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A9C4428A6
	for <lists+linux-leds@lfdr.de>; Wed, 22 Apr 2026 08:43:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4DC7D3012EB9
	for <lists+linux-leds@lfdr.de>; Wed, 22 Apr 2026 06:36:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BB143246F0;
	Wed, 22 Apr 2026 06:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IW9ucfVe"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2BF31F98C
	for <linux-leds@vger.kernel.org>; Wed, 22 Apr 2026 06:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776839791; cv=pass; b=BQd65btvTAhgr2KmfJxHTAjMLYPCnFpbCg75xZGO1+B/lfpQIue0HO3KesFtV4rkFYcD/Zu0WwDncwKc3vZCMO3ukg+Qx0nzNpwenmPPusxsjdby0h/3LKDTA7ve/1KHRnw7euwYYgq12V/goEfxZK81R1Hq7c3AojSzfIUHE9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776839791; c=relaxed/simple;
	bh=wfavpjAJSZ7hjRrsG7wTFAHndOUYUXOJbTCj7dcdkBU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=opzjDKubvs2KvVxKy8ELN24Eh6XsYX/maolcw1BnwzYwNG5wZXOqDGhcaTX5VnwoTMFt4UMh/9919FfdsMbc89p8WlP5H9jxuVAPCqfPF7DSD6EmG1OIizPYyMRNhPcHfO3AygIp+/twiyVbHz1Q35AKdNozYwDQWx2GF5NkhKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IW9ucfVe; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43fe608cb92so3486713f8f.2
        for <linux-leds@vger.kernel.org>; Tue, 21 Apr 2026 23:36:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776839788; cv=none;
        d=google.com; s=arc-20240605;
        b=AltnPioA/p8P2q32+ThH6i1XjSPV30UOujxlWFdCsoK0WyXtmDsdQ9b5O7qLuzJ0Wo
         YBQDwyHXkVFpdbMFzRVyxeg4zm3+arAxJ6G/B7ITf6EIU47ZOEfGImyjB1Xms17k1JwX
         7WSchqWD0OMKCVxL0S9tXtlfbKosan5hiW6FGj+IS5bCi6GvIhg+UMsND31G1Ag2Wugh
         oi5Q67gREnUIZK4zvCmkKydm99VPqYesd22P0wcQpKzErtd7iecrQd8fFxyqhN+/k2Ds
         fSMsdpsmI6+JOrtGQBLH2Vksbi08vO4dqFrlNF2Sk3jwDBXpTkVbUsc7CBjvvn41Uv+B
         X5Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eU0mpl2hFzbGd8K+Y1Yf6B7ztWaV8bpKCFESHc+BsSc=;
        fh=suvRViz0VFZ7J6bw4wL+n3UanGX2vNIL9zISs+pUE5I=;
        b=Gc3DnON58waTEtirufN5+RuqscLXN9T9/QbRRZA4riup6K+GjFbXirFnwtlXqC0Osk
         zydsD4YqtM0QCHtKERhl/4nPSlQOIoYQZdFc8CyWiEdvZOl1w9PGNbJ/7WeP23Lh+lZN
         UioV3VuGe3D3CdBYxQ8RQE1zsBDQwBv2S92vbLNuDZgpsB3a1uDB1NXMkOp+1u4WZsRV
         qav4XUl55vj/5F2/2jRZxzoDfmrjd93OwmKLTIFgkHx5TST5fmZwiYLjatWUMgbE5HAB
         +IU7xWVeJ4y0kIYVQKRfOXrPYzIDkEIqQdds+ykkxBhUOoHUDiZxtVzQpvT3UDD8ncO6
         kRMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776839788; x=1777444588; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eU0mpl2hFzbGd8K+Y1Yf6B7ztWaV8bpKCFESHc+BsSc=;
        b=IW9ucfVeT/mnGYgdSshb9A6jwQ0aWoPTd+/L0/mNQEziubP9LOAO80jXmXkMiUL8WI
         kTgrLMbtOFO3k6wNDQ9HWyEebrgoZSfR/ZXLVdqlibRJMXVlG4fZK3+8y9gah3L176Nq
         CcN1y+yITxuY93trrd1JfELQx+9CRkEr0FgrCyYL0liY9Qb+PoFe/mtbqBDwwelj1pHn
         IXx4sUuukSvCAvvDqYkhD2XxsWJeKYWr266+Sk0QSjUqOAZtcVkuO1/+2xjRWADy0xT3
         sujfqm3P7KJZ+UK8i+5hqMgLLiYnpGanQTrlVyP0fDoVD476g8fOwvglnao0htYh+wXj
         oXxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776839788; x=1777444588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eU0mpl2hFzbGd8K+Y1Yf6B7ztWaV8bpKCFESHc+BsSc=;
        b=busS4GxNpvPPhQB0ENpgjvr72OquVgwCeONaSKIqWt7vhufNs/UYFQohNERVU0E1Kn
         L/mrPcY/LJeeajDGt2B3yNH03JESJ7Iz2q4rCHS5r6GtRDb8n5Wu2IZNNYMt5mHIQ0y8
         NFLiUcMxPJFOk5eE3yUfs0breCFt80Dvd1whDkUvVexKnfx7SY4MgV7SpjZob25A3USD
         cZCH2zSSTpIj4KEnY6+Uld0x7RX+2n1nQbcntjrKy4wDEYvdxjcqhCvzcZtVCdxyWnQH
         gkegc9XBYXjcW+OSeW1eBr89IpaTU5z3RgSD1HRsgsJ93q7jGpnT3D4juqWW0FqG0G6I
         zVyQ==
X-Forwarded-Encrypted: i=1; AFNElJ9w8bEDkez/J6sXJWtd7H1eT0xxY0dvCOizwwxXfMmiWT8gyR7iBKLmZCc/usqLWZjxCut+hS1KgatC@vger.kernel.org
X-Gm-Message-State: AOJu0YzvINbyMnU15FDuxbLOeE9/ZlAZLTmhG+C5JM9U+58wxhPNwz7E
	CwkDtdrb/0vH/AwTVdMcxUmty7B1RcG4bo/unwujVj5QkT8sCQ2yToltqs4rEHBMx7U7M//lXI2
	cGdN+wOsiEXVTu9qt4EyR4jsCNveXn1U=
X-Gm-Gg: AeBDies/dsQwf6oeiNYVOsn6VfXTuSk+7sdBrwZOb3V5FUwMdt6PSsK9Qxq9cBXVH2x
	9H7Q7hoiKHZ72xVSPx0A85QQG8HEj5N+pWZvs/NNc7ZZiestgOYQ5Aaui/pEqjc5orjHseefJUf
	JjHG6832F+7NKZ2gro/9QJbaFU8ApPIp9lttAUqLQkOE6U5u+zVQY9hSjh9TSa1FQuxlTh8VnG0
	abUF9Vyb37/IxT9mXz/wymiwnMyB/S99fh+/HAe01RGiH6crM1nrEEPRUEn5LE9C920pV9HwRNg
	7mM6uiMVFZxDmUofRYE=
X-Received: by 2002:a5d:5f92:0:b0:43d:71f4:7ed5 with SMTP id
 ffacd0b85a97d-43fe3dc54famr32939529f8f.17.1776839787814; Tue, 21 Apr 2026
 23:36:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419093412.40796-1-clamor95@gmail.com> <20260419093412.40796-2-clamor95@gmail.com>
 <20260420-affection-ferocious-e28cd29f360a@spud> <aeZWgcARBqMQatrr@kekkonen.localdomain>
In-Reply-To: <aeZWgcARBqMQatrr@kekkonen.localdomain>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 22 Apr 2026 09:36:16 +0300
X-Gm-Features: AQROBzCUJhTnbg5bBGAy7L6DdQ6sPnv4p1g7vJBHYljdROCv4p5UQj1SToqiRiM
Message-ID: <CAPVz0n10Us=zU38v4ieqWXkQ2pXRKi=6M4i3k1Q5bJ4g2QQjgA@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: leds: Document TI LM3560 Synchronous
 Boost Flash Driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Conor Dooley <conor@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-7800-lists,linux-leds=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: A4A9C4428A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

=D0=BF=D0=BD, 20 =D0=BA=D0=B2=D1=96=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 19:3=
8 Sakari Ailus <sakari.ailus@linux.intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Conor,
>
> On Mon, Apr 20, 2026 at 05:20:28PM +0100, Conor Dooley wrote:
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - ti,lm3559
> > > +      - ti,lm3560
> >
> > What differentiates these devices to the point that fallback compatible=
s
> > are not suitable?
>
> Good question.
>
> It seems the currents are different albeit the register values themselves
> are the same. The driver doesn't seem to handle that properly right now, =
so
> it's a driver bug.
>
> I'd keep the compatibles as-is as the current limit applied should be as
> specified in DT.
>

This is a valid point. Unfortunately, I don't have device with lm3559
to adjust driver accordingly and test.

So, Conor, Sakari, what changes if any I should apply here in v3?

> --
> Kind regards,
>
> Sakari Ailus

