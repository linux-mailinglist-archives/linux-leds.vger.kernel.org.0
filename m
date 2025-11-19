Return-Path: <linux-leds+bounces-6196-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 11158C6C456
	for <lists+linux-leds@lfdr.de>; Wed, 19 Nov 2025 02:38:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 674F94E5DD8
	for <lists+linux-leds@lfdr.de>; Wed, 19 Nov 2025 01:38:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 083E523F429;
	Wed, 19 Nov 2025 01:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rXKxgaw4"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C3123EA9B
	for <linux-leds@vger.kernel.org>; Wed, 19 Nov 2025 01:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763516289; cv=none; b=TGB7FtDBYr11DBLw3fhVLEACyM483b+sTfNmkDCzPMauIhnSEllCytjRFyoh0E72vxjKdrTxBujjZBlTKBbQZU79C+3sOwkGTRHXs6g5uXb/ZUY9Qd+zZmQL0jriEay9dkfRJbsbReo+uQGX86WGEWHAMC61GeT3lXyDCRMkOmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763516289; c=relaxed/simple;
	bh=1zFHC/D3qDhaCV+4B0RKeie8bN/hEL/zcC1isKO/Ij8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HBjBuk0yyOgwb6zlr71YMs+suAWRvZLHrUUfM9qWkg/2NArZhzIq5GW7Rjni5hX7HnIM2IdHG07LLujD0tZIMXoKfM4F8a8wkgoq2YLKTIohmHKCRwubEoYFsDDwBqT7QE98W9aUjcyyJK3RrmEB206G0o3ygMCgoAu9p+m/HYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rXKxgaw4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D227C19421
	for <linux-leds@vger.kernel.org>; Wed, 19 Nov 2025 01:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763516289;
	bh=1zFHC/D3qDhaCV+4B0RKeie8bN/hEL/zcC1isKO/Ij8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rXKxgaw4ugmF2j6wHMGVaVlOkXKPKdbFsalN2P7BY0dVzufkrRPGtRcSOXxc2Y5Ud
	 Eon7MDcFe+Yh8cJaMvJr1O9IKvfRQ/fyi/V48LRcqX08ZaDDeeekuAmFddOxpKWJ9f
	 bFgj5LapqFH2A2xs/pGRBXqlrK24Bh3KcCOZ/iU5kEXqS3mh4NwUXEsuzBRW+ElpkZ
	 Uo4Kut4mB2X0pTR4BMrt3OdIF2SL2wSae4lIkShRqFGN+4MWXQtIpeFkiE+Pmpc3zm
	 9zekCApsD43kiIpFz2xEPBf/GHEyJ4LfMD6iKPhYuWUNj3X+0ZRdiK2wzmyG1pcOR/
	 mfn836/zXiQsA==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-64180bd67b7so8464850a12.0
        for <linux-leds@vger.kernel.org>; Tue, 18 Nov 2025 17:38:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWSLadLfOJi7z+5rjJTX5rrGoLmhO74eJFodMnA3tE6gBhnnpx6+AYN/TNE4gl24kdD6tmcgvica1ia@vger.kernel.org
X-Gm-Message-State: AOJu0YwXy1b6xhC2bdm9Za3vmMhvoL1usYcnN0V7w5/dJ640EDBlXyqO
	9ortTUDE/YzKmteQ7KYoXA9yFvCufHhfgt+M5zX9dDIO4IKkrJ9OCrSjm33+UaiQzDTTkdnuqCw
	Pde9rwykWqS2N0Tc1/FLHVBsflgyMFw==
X-Google-Smtp-Source: AGHT+IEGIARixQQxL/Z1vr1zZwusANAarRAXKjnwQT9SgCWjwfycQbJPhMJgCUV5i3+Ije/OVDWoe3jsxHkuyDWz110=
X-Received: by 2002:a05:6402:2396:b0:640:a836:eacf with SMTP id
 4fb4d7f45d1cf-64350ead477mr11536886a12.26.1763516286855; Tue, 18 Nov 2025
 17:38:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251117215138.4353-1-sander@svanheule.net> <20251117215138.4353-3-sander@svanheule.net>
 <CAL_Jsq+Mzj+3d4q+xQLq_GEYzRJA6E+CEJ9M8FQH6kL9eBZhVg@mail.gmail.com> <9fc358372ef267530b4304b4fa1cf5643c18cb42.camel@svanheule.net>
In-Reply-To: <9fc358372ef267530b4304b4fa1cf5643c18cb42.camel@svanheule.net>
From: Rob Herring <robh@kernel.org>
Date: Tue, 18 Nov 2025 19:37:55 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKKpymk_i9c=29Zq0QSzHMU3x0RPWjBMmW84k_5jUe4Jg@mail.gmail.com>
X-Gm-Features: AWmQ_bma3IwgMlrXQXQ04kE3R6adJH2pYZDDa4bWglo_Mov9dGx6o8xd45F7CwY
Message-ID: <CAL_JsqKKpymk_i9c=29Zq0QSzHMU3x0RPWjBMmW84k_5jUe4Jg@mail.gmail.com>
Subject: Re: [PATCH v7 2/6] dt-bindings: mfd: Binding for RTL8231
To: Sander Vanheule <sander@svanheule.net>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Michael Walle <mwalle@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 3:57=E2=80=AFPM Sander Vanheule <sander@svanheule.n=
et> wrote:
>
> Hi Rob,
>
> On Tue, 2025-11-18 at 15:28 -0600, Rob Herring wrote:
> > On Mon, Nov 17, 2025 at 3:52=E2=80=AFPM Sander Vanheule <sander@svanheu=
le.net> wrote:
> > > +patternProperties:
> > > +  "-pins$":
> > > +    type: object
> > > +    $ref: /schemas/pinctrl/pinmux-node.yaml#
> >
> >          additionalProperties: false
>
> In this case dt_binding_check doesn't recognize input-debounce. The follo=
wing seems to
> work for the provided example:
>
> -    $ref: /schemas/pinctrl/pinmux-node.yaml#
> +    allOf:
> +      - $ref: /schemas/pinctrl/pincfg-node.yaml#
> +      - $ref: /schemas/pinctrl/pinmux-node.yaml#
> +
> +    additionalProperties: false
>
>
> with this included in the led node properties:
> +      input-debounce: true
>
> If I understand correctly, "unevaluatedProperties: false" (like for the l=
eds binding)
> would allow everything from the referenced pincfg-node and pinmux-node sc=
hemas, which is
> more than is actually supported by this device.

Yes, that works too. The first way lets you be explicit about which
referenced properties are used, but either way is fine. If it is only
1 property, then I'd probably go with the first way.

Rob

