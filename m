Return-Path: <linux-leds+bounces-567-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A218828EBF
	for <lists+linux-leds@lfdr.de>; Tue,  9 Jan 2024 22:08:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21B481C21D56
	for <lists+linux-leds@lfdr.de>; Tue,  9 Jan 2024 21:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E5153D990;
	Tue,  9 Jan 2024 21:08:45 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A653DB83;
	Tue,  9 Jan 2024 21:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5edfcba97e3so35515797b3.2;
        Tue, 09 Jan 2024 13:08:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704834522; x=1705439322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ou0uJjnqdVrwGTnsKmsHT6mcPF+R3KUdw+aSzuNonSY=;
        b=syb8mA67mvarefPaxkJCSbj7KgAvBMeI90Vys5npZWwXxEZASySRd8I5RFjiVMTxnn
         Tp6wGphndETA8kFNY5+nNE5+IVAUK3UchKDnHh3yHEhhb8wl9FSjy8jeIS59iCg1Fub7
         A/bX6R3qyDuBmU5Z87SlJUpG4QPcJSGEYZMbJYbuEKZ/BYN+bx8WM3gr87/72SBqz+Wy
         ulYYEIBKvs22H9FbvU1lJTHo7pEm9J/1SxcPUVEJWbrgpFBgtXTDgEnim9y5mz9yBZTN
         EvRsTGMJz9ighzcLyMkxL1c3krFCeA3FAICa0D1OZ0baF2t6oC7/5m1oNG3Wb7WfST/0
         AKSw==
X-Gm-Message-State: AOJu0YzWjhT4413XQUy8kNbxsHr606wxxDmnnoxRl/gyClK5XMAkjosK
	0anEe1mWLJqRI496VIF8jKqpBadNTyg5Ix87
X-Google-Smtp-Source: AGHT+IERaj3vAKxHj8zif62UdBINrHwdLERbfCHcZHDagbPWITm0EDwUJctkdZ9xS889EmBez16esw==
X-Received: by 2002:a81:5256:0:b0:5f3:2c5e:462f with SMTP id g83-20020a815256000000b005f32c5e462fmr93822ywb.51.1704834522002;
        Tue, 09 Jan 2024 13:08:42 -0800 (PST)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id dz8-20020a05690c278800b005f93cc31ff0sm973010ywb.72.2024.01.09.13.08.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jan 2024 13:08:41 -0800 (PST)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5ec7a5a4b34so35684227b3.0;
        Tue, 09 Jan 2024 13:08:41 -0800 (PST)
X-Received: by 2002:a81:48c9:0:b0:5ee:fc9d:d452 with SMTP id
 v192-20020a8148c9000000b005eefc9dd452mr76051ywa.43.1704834520801; Tue, 09 Jan
 2024 13:08:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240109082312.9989-1-zajec5@gmail.com> <1b90c50c-0a09-4627-83cd-1794dae7ed9b@linaro.org>
 <69966efa-21ab-4a38-ad06-61e7e2e5b6d3@gmail.com> <987fe3e7-adc8-489f-867b-2d3aaa004d94@linaro.org>
In-Reply-To: <987fe3e7-adc8-489f-867b-2d3aaa004d94@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 9 Jan 2024 22:08:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW4BVWd93GcKwujb1p_gdOejDKwq9ewrwCqytDFRW9r=A@mail.gmail.com>
Message-ID: <CAMuHMdW4BVWd93GcKwujb1p_gdOejDKwq9ewrwCqytDFRW9r=A@mail.gmail.com>
Subject: Re: [PATCH dt-schema] schemas: chosen: Add OpenWrt LEDs properties
 for system states
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	linux-leds@vger.kernel.org, openwrt-devel@lists.openwrt.org, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Tue, Jan 9, 2024 at 8:10=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 09/01/2024 17:38, Rafa=C5=82 Mi=C5=82ecki wrote:
> > On 9.01.2024 10:02, Krzysztof Kozlowski wrote:
> >> On 09/01/2024 09:23, Rafa=C5=82 Mi=C5=82ecki wrote:
> >>> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> >>>
> >>> OpenWrt project provides downstream support for thousands of embedded
> >>> home network devices. Its custom requirement for DT is to provide inf=
o
> >>> about LEDs roles. Currently it does it by using custom non-documented
> >>> aliases. While formally valid (aliases.yaml doesn't limit names or
> >>> purposes of aliases) it's quite a loose solution.
> >>>
> >>> Document 4 precise "chosen" biding properties with clearly documented
> >>> OpenWrt usage. This will allow upstreaming tons of DTS files that noo=
ne
> >>
> >> typo: none
> >
> > typo: no one ;)
> >
> >>> cared about so far as those would need to be patched downstream anywa=
y.
> >>
> >>  From all this description I understand why you want to add it, but I
> >> don't understand what are you exactly adding and how it is being used =
by
> >> the users/OS.
> >
> > In OpenWrt we have user space script that reads LED full path:
> > cat /proc/device-tree/aliases/led-<foo>
> >
> > And then sets LED to state matching current boot stage:
> > echo 1 > /sys/class/leds/<bar>/brightness
>
> OK, it's nowhere close to a hardware property. You now instruct OS what
> to do. It's software or software policy.

> >> Anyway, we have existing properties for this - LED functions. Just
> >> choose LED with given function (from sysfs) and you are done. If
> >> function is missing in the header: feel free to go, least for me.
> >
> > In "Describing LEDs roles in device tree?" e-mail I wrote:
> >
> > "
> > Please note that "function" on its own is not sufficient as multiple
> > LEDs my share the same function name but its meaning may vary depending
> > on color.
> > "
> >
> > Let me elaborate here.
> >
> > Values of "function" property match LEDs descriptions (usually it's a
> > physical label). That is OK and makes sense but doesn't allow OpenWrt t=
o
> > automatically pick proper LED to use during given boot stage.
> >
> > Some devices may have multiple color of a the same LED function. OpenWr=
t
> > developer needs to choose which color to use for failsafe more and whic=
h
> > boot fully booted state (and others too).
> >
> > Devices also differ in available LEDs by their functions. Some may have
> > LED_FUNCTION_POWER that OpenWrt needs to use. Some may have
> > LED_FUNCTION_STATUS. Or both. There are some more (less common)
> > functions like LED_FUNCTION_ACTIVITY.
> >
> > We failed at OpenWrt to develop a single generic script to rule all
> > devices and all their LEDs combinations. We ended up with developers
> > *choosing* what LED to use for a given system state.
>
> So this all is because you want to write easier OS. That's abuse of
> Devicetree. You can define which LEDs have different meaning, e.g.
> physical label or icon attached to them. That's a hardware property.
>
> You can also define how pieces of hardware are wired together and create
> entire system, e.g. connect one LED to disk activity.
>
> However what you are proposing here is to dynamically configure one,
> given OS. I don't think it is suitable.
>
> The problem of OS to nicely figure out which LED to blink when, is not a
> problem of Devicetree. It is a problem of OS and its configuration.

I'd say it's a grey area...

What if the colors are printed on the case, next to the LED?
Like these multi-color LEDs indicating port speed on network switches?
Then it suddenly becomes hardware description, just like
"aliases/serial2 =3D &...;" referring to serial port 2.

Next, what if the colors are not printed on the case, but documented
in the product's manual?
What if there is no paper product manual, but just the OpenWRT online
documentation?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

