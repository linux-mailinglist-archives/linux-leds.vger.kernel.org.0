Return-Path: <linux-leds+bounces-6894-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aG7BK0YQiWnG1wQAu9opvQ
	(envelope-from <linux-leds+bounces-6894-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 08 Feb 2026 23:37:58 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 593D910A7D2
	for <lists+linux-leds@lfdr.de>; Sun, 08 Feb 2026 23:37:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0530230097DD
	for <lists+linux-leds@lfdr.de>; Sun,  8 Feb 2026 22:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85FD637B41E;
	Sun,  8 Feb 2026 22:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bdZFWtvS"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6036B37B407
	for <linux-leds@vger.kernel.org>; Sun,  8 Feb 2026 22:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770590274; cv=none; b=KLboQbQ8mOoFPOCnmA56Tb58vlVzOeVfIKSpML3NEkC+/8DSWzcbjXo7Zd56D96yVY3cG9YR6lXy1Pdo0mFuJn4cwh8kkfl+bYuig+0yvhWZQX6rzJ9AKwprTT7PJAjzoh7MjBE1YHTWqfNeckKCifTT6I4Va8bkybDtWqZa2O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770590274; c=relaxed/simple;
	bh=9zzQCS0ZD52rCJwUkgpOBtKinN566jajYieUXkw0Tlo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qkY0YzGv7gn7f0pyzusjEAYXfoaod1MatIMGMgJ8NGjj5GnyqcVe1oiCOkwSSi8V1EaKAmE9/hDGkgf6xAm4wPs7nvqwJq9b+s3PC9XhpQflmRdeIKNByEtAzbrGO/KShkGUzHjQxwm8scmKdijxfowDkK6D56VnT4kJZpeanZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bdZFWtvS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E254C4AF0B
	for <linux-leds@vger.kernel.org>; Sun,  8 Feb 2026 22:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770590274;
	bh=9zzQCS0ZD52rCJwUkgpOBtKinN566jajYieUXkw0Tlo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bdZFWtvSBGcOKmB+GRti5ic9lxm+I/CAY64eIdpyy//cr2tHE6pTcd5XwIXKPKwzg
	 5TZwprXaQqtXFSTWWy9KQgtn9nJBf0aDHKLKzpRQBNpnsFeZWLyRUyoiDUEbVZuYq3
	 j+qOqLQJCUJhTskWdTAnRgLQphy2OjUyu1uuEY4MoGUWURAj8h3jyxFexi9h3WKxfU
	 R3eG/QP6QbtNf28Ere07+bTG8wT59PtlSICg29/TfIfz1hl/2XB5Mw4jWi19OdrFdh
	 GVL9zNU+++tAsNN3Q/mRYT5TBXyWLQxZSr3MHYbbI3SgWK861hK+nIqLLGe7KFOKI5
	 BWbCv2bm9VdTg==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b8e9f89a8e3so419188866b.1
        for <linux-leds@vger.kernel.org>; Sun, 08 Feb 2026 14:37:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV7Cp04GL/YLQVLIclaLp2mxQeki+c7jaz6O2dayr1Xb/REtHDW1iBeQvOxMPKRJEMtmq3UAnK3/abt@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/bNDo/gE3Y6wB0J/3BSCcNobjMv4QGtadjDBV9J9MsNA08GAy
	+YAx47aJ1H0HjeE0CQbnmxFH8qNTlFpIOdEIXQL3fuku7+axC3LI5DW9ExITwAggVKoSBbsew9S
	yFuWQBFE8uXDjLjx33Ck/+ofbsLQX+w==
X-Received: by 2002:a17:906:6a18:b0:b8d:f859:d228 with SMTP id
 a640c23a62f3a-b8edf1a942amr477887566b.17.1770590272539; Sun, 08 Feb 2026
 14:37:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260206172845.145407-1-clamor95@gmail.com> <20260206172845.145407-2-clamor95@gmail.com>
 <20260206230922.GA254792-robh@kernel.org> <CAPVz0n3EGCSLUX7jTLve0x0z4uW1yexViCwkSQLY2d_4r4qkjg@mail.gmail.com>
 <db9115ca-2c8f-4b5e-89ce-f3b934071a59@baylibre.com> <CAPVz0n2KwqPw88JVcPzhTQ2n+GKzahkrEThjjrqm0CSdjKTEOw@mail.gmail.com>
 <51eddfc0-9f23-4a7f-8729-19775d834c0b@baylibre.com>
In-Reply-To: <51eddfc0-9f23-4a7f-8729-19775d834c0b@baylibre.com>
From: Rob Herring <robh@kernel.org>
Date: Sun, 8 Feb 2026 16:37:41 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+JzAnvW3zSC7Y=dpWTKMUwFfTOuAnMS21d+F_W=5ONeg@mail.gmail.com>
X-Gm-Features: AZwV_QiXE7FF0AsUcBwXkZ1sUoiJVr-4CydnqWTJFagZ120T9XrMYxQRlj7pE10
Message-ID: <CAL_Jsq+JzAnvW3zSC7Y=dpWTKMUwFfTOuAnMS21d+F_W=5ONeg@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] dt-bindings: regulator: cpcap-regulator: convert
 to DT schema
To: David Lechner <dlechner@baylibre.com>
Cc: Svyatoslav Ryhel <clamor95@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
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
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6894-lists,linux-leds=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,analog.com,atomide.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 593D910A7D2
X-Rspamd-Action: no action

On Sat, Feb 7, 2026 at 11:32=E2=80=AFAM David Lechner <dlechner@baylibre.co=
m> wrote:
>
> On 2/7/26 11:25 AM, Svyatoslav Ryhel wrote:
> > =D1=81=D0=B1, 7 =D0=BB=D1=8E=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 19:19 D=
avid Lechner <dlechner@baylibre.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >>
> >> On 2/7/26 3:20 AM, Svyatoslav Ryhel wrote:
> >>> =D1=81=D0=B1, 7 =D0=BB=D1=8E=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 01:09=
 Rob Herring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> >>>>
> >>>> On Fri, Feb 06, 2026 at 07:28:35PM +0200, Svyatoslav Ryhel wrote:
> >>>>> Convert devicetree bindings for the Motorola CPCAP MFD regulator su=
bnode
> >>>>> from TXT to YAML format. Main functionality preserved.
> >>>>>
> >>
> >> ...
> >>
> >>>>> +properties:
> >>>>> +  compatible:
> >>>>> +    enum:
> >>>>> +      - motorola,cpcap-regulator
> >>>>> +      - motorola,mapphone-cpcap-regulator
> >>>>> +      - motorola,xoom-cpcap-regulator
> >>>>> +
> >>>>> +  regulators:
> >>>>> +    type: object
> >>>>> +
> >>>>> +    patternProperties:
> >>>>> +      "$[A-Z0-9]+^":
> >>>>
> >>>> I thought it was said on the last version to list the names. Conside=
ring
> >>>> you already have them below, better to put them in schema than prose=
.
> >>>> And pretty much all regulator bindings define the names.
> >>>>
> >>>
> >>> What exactly do you propose? All those names will not fit into a
> >>> single unbreakable line (more than 125 columns in length btw). Patch
> >>> checker will complain about this. Duplicate pattern properties for
> >>> every few names? Please be a bit more specific. Thank you!
> >>
> >> Making checkpatch happy is not a hard requirement. If you have to
> >> go over 125 characters for technical reasons, no one is going to
> >> complain.
> >>
> >> I already gave an example on the last version. It is just a regex
> >> expression. (And note that you didn't fix the $ and ^ either. ^
> >> means beginning of the line and $ means the end of the line. So
> >> the pattern currently won't match anything.)
> >>
> >> patternProperties:
> >>   "^(SW1|SW2|SW3|SW4|SW5|...)$":
> >>
> >>
> >> And I hope it is obvious that you are meant to replace ... with the
> >> rest of the names separated by |.
> >>
> >
> > David, thank you for your suggestions and I did not want to offend you
> > nor Rob, or ignore. Using this large string IMHO feels a bit wrong. No
> > offence, I will use it if required. At the same time I was
> > experimenting with possible representation and come up with smth like
> > this:
> >
> >     patternProperties:
> >       "^SW[1-6]$":
> >         type: object
> >         $ref: /schemas/regulator/regulator.yaml#
> >         unevaluatedProperties: false
> >
> >         required:
> >           - regulator-name
> >           - regulator-enable-ramp-delay
> >           - regulator-min-microvolt
> >           - regulator-max-microvolt
> >
> >       "^V(CAM|CSI|DAC|DIG|FUSE|HVIO|SDIO|PLL|RF1|RF2|RFREF)$":
> >         type: object
> >         $ref: /schemas/regulator/regulator.yaml#
> >         unevaluatedProperties: false
> >
> >         required:
> >           - regulator-name
> >           - regulator-enable-ramp-delay
> >           - regulator-min-microvolt
> >           - regulator-max-microvolt
> >
> >       "^V(WLAN1|WLAN2|SIM|SIMCARD|VIB|USB|AUDIO)$":
> >         type: object
> >         $ref: /schemas/regulator/regulator.yaml#
> >         unevaluatedProperties: false
> >
> >         required:
> >           - regulator-name
> >           - regulator-enable-ramp-delay
> >           - regulator-min-microvolt
> >           - regulator-max-microvolt
> >
> > Will this be acceptable? It passes checks
>
> I think we would rather have the long match string instead of
> repeating the rest of it multiple times.

Yes.

105 chars:

    "^(SW[1-6]|V(CAM|CSI|DAC|DIG|FUSE|HVIO|SDIO|PLL|RF[12]|RFREF|WLAN[12]|S=
IM|SIMCARD|VIB|USB|AUDIO))$":

There is the yamllint of 110 which does have to be followed.

Rob

