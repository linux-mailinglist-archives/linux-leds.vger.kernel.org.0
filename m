Return-Path: <linux-leds+bounces-6899-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELMKMs2jiWlU/wQAu9opvQ
	(envelope-from <linux-leds+bounces-6899-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 09 Feb 2026 10:07:25 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE7610D587
	for <lists+linux-leds@lfdr.de>; Mon, 09 Feb 2026 10:07:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5944F30086E9
	for <lists+linux-leds@lfdr.de>; Mon,  9 Feb 2026 09:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E944328B7B;
	Mon,  9 Feb 2026 09:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LPYJolRd"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B29328B69
	for <linux-leds@vger.kernel.org>; Mon,  9 Feb 2026 09:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770628028; cv=pass; b=V+4wqH4pzm0cP5WyMNs04aYbzxHlYiWc949x/qYoVC3I/zlgvsex58MRSXmLH0P9YoawEtYrd/XtoXVaJ6gmqTWYKF/JtRdsg4T++irgbwpqRXcBOrRqaS/2vhDXs6N3/ymn6wy30WADs35yyAEPF5Vx5l85TcAiOXWwgjSGiHo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770628028; c=relaxed/simple;
	bh=ARNZTT0ZHaBrZDbctujL9G/d4o2dbqa30Uva3TCyzX4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oXhcI2VhI1BBGS+qgRxWs8/LPmv3NIMHdLykV3R5S+bRda+6ityx1nQudeE6hkCxeddWLaVksHcPC5ZjXJoK4/hrvwZWKgL+7jKcUB+UMqZr7bt9+HT1MzFtd9O77bhsOklHPUkawO4E/VYzFLdbl9dQsKoxeCnlghiD1vYVFXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LPYJolRd; arc=pass smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4359a302794so1688313f8f.1
        for <linux-leds@vger.kernel.org>; Mon, 09 Feb 2026 01:07:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770628026; cv=none;
        d=google.com; s=arc-20240605;
        b=NXzmmHSCw790fWYdbNLCTd2rdoeAWeHpWCYn4hM/YmjMAp7y+c1P/Re2b3L/XsE9jx
         rO8+z9BmKIKMv1n/Mwpt7GxHLpiJXbFxulOzE4Vsaxjv4L4OWws/iyEIFqFr1R1WryVR
         7iQuqBj5Bt+RAvS53gg6Yi2i3jQgL8BewLgwKo8QYtjKsVYKPXs/cILnlfXJX8TrOizF
         958v6yIYjbFHjWuZgtufysbbf4zNZCrQunJILs/mPrHQ7U7/t1GzWqaycgunWQHPy4f7
         ARwqE1YpG1rJ3bDxn1Pv+laHLmogqQkO34/EuHdLEh3PmJmJGPOlmU5tOtdcatnP5D0E
         NHyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ARNZTT0ZHaBrZDbctujL9G/d4o2dbqa30Uva3TCyzX4=;
        fh=NvQXbVlXqdRm6Kjzqq9g8fC4U1zaeXRf5u9uXIliO80=;
        b=hWUgt+VPveLkm5stN++hq3k7tzurTB1L7ZH0nnEujccfZBABczVi9RftTVb4I0bXAz
         kmgoL8dpQo98BOhMzrSreGdair3b9/U67Cnp1vSZC0GvIhxYLTTe8u9bFgKocqxxIhal
         4bjWT35fzCVM0u/HTVkWQ+hRnuZpKlrQhmHT8WG6p9yH+I/vZRa2PrGP3yZPy6Mn3INy
         uHvaDlTtbqJwVaJOpfvUSqkrIlGP1ZSgrGyZwOF2aoebd082EycjKjUtvfIXAaxmpDzq
         hYBSNNg8VoSE9V/A3KXswr95zfyS21opoZlZZN/qYMQE9XniCwgkyNXWRmVj0dvCDqsK
         J3/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770628026; x=1771232826; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ARNZTT0ZHaBrZDbctujL9G/d4o2dbqa30Uva3TCyzX4=;
        b=LPYJolRdSSRxYinDkCi8JHgOkqNUZp76bD7EU177xUHiKXM35vsveBHoZzt6v47BEc
         qRYpoUeeMhtVogm4fl74RxdQTJN/ScwZUSw4ICCqDIKS9fVbB0/XWfxT2Kej7tWpWVK0
         0zoLN4iS4SRV5PKuKeMaojzs+cC8FVgVUlyc+rQ1flBNTFV6IKvYZ1aUuQVd36Do/bX3
         X+z9pF2PlsICvgaQCDJ1hCr5RTS4X2d+wm709uOgQaWiZP5GqayqvEyB+hEVQjc5d/1+
         sVnF0K2Qmb84CjkXeWkwn/IKD8PUIUr/Nn05TX/aTz4/ojqbtGLzYlqwfHN/xS78LLOV
         YtJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770628026; x=1771232826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ARNZTT0ZHaBrZDbctujL9G/d4o2dbqa30Uva3TCyzX4=;
        b=EFwx5n/y9SoXc+b1o+Nul6nu/tiXxDu3E2UrOPwfYs1/isysYEYAIpLwzheaONM6V4
         6Atchyjz4XVtb3sp9wSMRcECQzW3zsXeiJU8y03gsrrXeFSqwJvqnRdBYKyyUuSRpPFk
         BMKW/Jkn5Huk6qp1r98mxl2TzzgMB/IRozrG3TE5MoaJNASg90oEObdAinc88vdu8qg0
         bzCA/kdNSSqFl5FoMf7eZfvq1HmcAN6/9SFUOtqDohQCtVg3IcIgqSFYFXjDq+xKbK8F
         TVPMv+i7N9zGDZJxvuZtDbRnzY1OnMAiXJIxhVHX66kr8rcnYcbFBC1lAWKtLCsKwRWU
         BWuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoQn+DvtkkU+ZeH32fNFySeFIcrUK9tA0hE4y9cw7RN+l2eoM0ko34My4aj3v+Omr/+0Rfd7V1sWwZ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywain6QB/MCxQEfiPq9bfAkH8Q1lR69ADQN5wuVBS47JuppR7ks
	/lKzh/oSSIMLtsef/MIwFZHwzqVSN/miC8Y86XmQvQac15r0MFwbAK9I1WYbC2PrR3J8goQZfIb
	sEHTTre4tLGu42SVWXpEciQxd0e//VdA=
X-Gm-Gg: AZuq6aLgQEMjV+lCPmkVsX+GyEyGsq9Q3Hdm/nP1tccXG2aWaePFzG90ebx9s6rYPxn
	7N/jhcld77mMegP9vPIqMeU9NqymG4j4AMSl9jU1mbR9rpZGLJaKturv8sYplPxNqim/0+XkzWm
	hmkQIobLGbI2ZU1WTIXhkRZE9evsRT4wEgyIjOZ3DTec073biFzaD/yRvjWnKaEbOznrgFtW1L9
	DcknZSoPfNaLNFX3QpFOFwlXgkpP73lWg0WFeIgP9ropaucZnuzMUZ39Zf6vxhjzuYCRbr1
X-Received: by 2002:a05:6000:2913:b0:432:5c34:fb32 with SMTP id
 ffacd0b85a97d-4362933f436mr17440511f8f.23.1770628025680; Mon, 09 Feb 2026
 01:07:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260206172845.145407-1-clamor95@gmail.com> <20260206172845.145407-11-clamor95@gmail.com>
 <aYiHnUW93AB0ARJH@smile.fi.intel.com> <D8B3E97F-3405-4EBD-882D-677F530E4EDB@gmail.com>
 <aYmYcd0431P5sUtq@smile.fi.intel.com> <5AA39777-F5C8-4AD5-A5C2-47265C8213F5@gmail.com>
 <aYmg_7uq2rAWJgGK@smile.fi.intel.com>
In-Reply-To: <aYmg_7uq2rAWJgGK@smile.fi.intel.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 9 Feb 2026 11:06:54 +0200
X-Gm-Features: AZwV_QgwoS53VSYtsaxPBt7zkNokx4yMZnC0-ZnRQ3AbohXwTZvajTpszTk4bdc
Message-ID: <CAPVz0n0+UxdocZdLtqPz=5m5RMV_K2Ldqsf53-13hUiLpV6c6A@mail.gmail.com>
Subject: Re: [PATCH v2 10/11] mfd: motorola-cpcap: diverge configuration per-board
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Dixit Parmar <dixitparmar19@gmail.com>, Tony Lindgren <tony@atomide.com>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6899-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,analog.com,gmail.com,atomide.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 6BE7610D587
X-Rspamd-Action: no action

=D0=BF=D0=BD, 9 =D0=BB=D1=8E=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 10:55 Andy =
Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, Feb 09, 2026 at 10:42:02AM +0200, Svyatoslav Ryhel wrote:
> > 9 =D0=BB=D1=8E=D1=82=D0=BE=D0=B3=D0=BE 2026=E2=80=AF=D1=80. 10:18:57 GM=
T+02:00, Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=
=D0=B5:
> > >On Sun, Feb 08, 2026 at 05:19:49PM +0200, Svyatoslav Ryhel wrote:
> > >> 8 =D0=BB=D1=8E=D1=82=D0=BE=D0=B3=D0=BE 2026=E2=80=AF=D1=80. 14:54:53=
 GMT+02:00, Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=
=88=D0=B5:
> > >> >On Fri, Feb 06, 2026 at 07:28:44PM +0200, Svyatoslav Ryhel wrote:
>
> ...
>
> > >> And please, may you contain all your reviewing in one iteration. The=
n both of
> > >> us will spend less time working on the patch. Thank you!
> > >
> > >It's an impossible request, you should understand that. If you want, u=
se AI
> > >or your robot colleagues for that, I'm just a human being, I can't see
> > >everything at once.
> >
> > Ability to see only nits and don't see the possible issues seems to be =
a talent.
>
> Paying respect to the reviewers requires some talent, indeed.
>
> ...
>
> Also, train your logic a bit, why do humans have so many professions? Acc=
ording
> to your "logic" one should be a doctor and a cook and a programmer. Why n=
ot?
>
> Or even closer to this case, a doctor must be a surgeon, a dentist, a the=
rapist,
> and you name it. Why not?
>

If seems that my expectations were too high. Apologies, my mistake. I
will keep in mind to spare you from wasting your time on reviewing my
patches in the future.

Regards.

> --
> With Best Regards,
> Andy Shevchenko
>
>

