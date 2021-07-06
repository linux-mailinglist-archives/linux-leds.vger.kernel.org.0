Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FDA63BC79A
	for <lists+linux-leds@lfdr.de>; Tue,  6 Jul 2021 10:02:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230295AbhGFIFb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 6 Jul 2021 04:05:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43297 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230257AbhGFIFa (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 6 Jul 2021 04:05:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1625558572;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=+swUsT6jfn8OEw879qU85kP2j+79w+z6Jt4ztqDMvpo=;
        b=Cgkgfq9U83AgqEXHOZ/j6tmj5MD1qkhbmHA+/oCrOMPuctcm9cY8uMXzvTHXDV2MXcT895
        nv9GMMwEnTIu7B1/tvhQHl61TwSA8YIzX2mzWh0Piynj1/+INEHFzl+sFtfwQqOYEdDGSq
        LMdE9CoEYz9SWVmdgK4bKS7gFBfc9mo=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-hpKEnI_MPPWXCyW_3dPwYQ-1; Tue, 06 Jul 2021 04:02:49 -0400
X-MC-Unique: hpKEnI_MPPWXCyW_3dPwYQ-1
Received: by mail-pf1-f200.google.com with SMTP id t17-20020a62ea110000b029030fd2a30515so13326748pfh.20
        for <linux-leds@vger.kernel.org>; Tue, 06 Jul 2021 01:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+swUsT6jfn8OEw879qU85kP2j+79w+z6Jt4ztqDMvpo=;
        b=oe6bvEmP8FR9VbRKnfTEbt7FFeuFGNq6jkGhxGwD5bCzrVXuwjzO83dbEbsfhs4lnH
         Eswk3jnz9/E2gbchydQT+vMkmZuZbdKmYoG0o8Y+m+IWj3axEPXJ+cP4gYm2wwLXGGcd
         TYIl0qEVYDHcEbnLAbT7eu+5LuPVYAP2JEuq+x+MAK+oHYmixGgC43X3WSkkOxvPP/gn
         vl7Z/9TL1w5HorrAA2zIlLVTwEuBASiHDSZwzPxX0Z/mCwQYmdNd+ywSfbILKMeRY9Fn
         0MDgKjF4+lMJABJjtGCxGE2la6g40fEjpUb/2xwq6qW3h6ObpES9GLSDebfUxklIFNQ1
         TdXQ==
X-Gm-Message-State: AOAM530w2FDknBQv9N2jp/gdcnsPC2K7KtRHexbb3hLcEYjvIAzqutVI
        3ukH41yiyVZpQuoIe4Xxo0BvDVhNtZXuZ2d5ZkznEjH/Z0oRK1Bmvb69Mtek+Rhj2b7m045r+m+
        WH4DGHGT4ke6l6yEoc9wLsj8pKUmCV5v/KliRJA==
X-Received: by 2002:a17:902:e5d0:b029:129:b045:ffb with SMTP id u16-20020a170902e5d0b0290129b0450ffbmr1180041plf.41.1625558567986;
        Tue, 06 Jul 2021 01:02:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7uA1JRg8MsIVmaLevHXUJY8rWznA01LvLEUQpGY5+hHO4RWODpYWBnxeZnbAMkItBKZKlnG/RDG4srQa9Ssg=
X-Received: by 2002:a17:902:e5d0:b029:129:b045:ffb with SMTP id
 u16-20020a170902e5d0b0290129b0450ffbmr1180019plf.41.1625558567746; Tue, 06
 Jul 2021 01:02:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210703220202.5637-1-maxtram95@gmail.com> <20210703220202.5637-2-maxtram95@gmail.com>
In-Reply-To: <20210703220202.5637-2-maxtram95@gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 6 Jul 2021 10:02:36 +0200
Message-ID: <CAO-hwJJxJqgW6CGPmvL41teh6vgWfSg55qoXWL3TjQx+mvsbHg@mail.gmail.com>
Subject: Re: [PATCH 1/6] HID: hid-input: Add offhook and ring LEDs for headsets
To:     Maxim Mikityanskiy <maxtram95@gmail.com>,
        linux-leds@vger.kernel.org
Cc:     Jiri Kosina <jikos@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Daniel Kurtz <djkurtz@chromium.org>,
        Oliver Neukum <oneukum@suse.de>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Maxim,

On Sun, Jul 4, 2021 at 12:02 AM Maxim Mikityanskiy <maxtram95@gmail.com> wrote:
>
> A lot of USBHID headsets available on the market have LEDs that indicate
> ringing and off-hook states when used with VoIP applications. This
> commit exposes these LEDs via the standard sysfs interface.
>
> Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
> ---
>  drivers/hid/hid-input.c                | 2 ++
>  drivers/input/input-leds.c             | 2 ++
>  include/uapi/linux/input-event-codes.h | 2 ++
>  3 files changed, 6 insertions(+)
>
> diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
> index 4286a51f7f16..44b8243f9924 100644
> --- a/drivers/hid/hid-input.c
> +++ b/drivers/hid/hid-input.c
> @@ -798,6 +798,8 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
>                 case 0x4b:  map_led (LED_MISC);     break;    /*   "Generic Indicator"        */
>                 case 0x19:  map_led (LED_MAIL);     break;    /*   "Message Waiting"          */
>                 case 0x4d:  map_led (LED_CHARGING); break;    /*   "External Power Connected" */
> +               case 0x17:  map_led (LED_OFFHOOK);  break;    /*   "Off-Hook"                 */
> +               case 0x18:  map_led (LED_RING);     break;    /*   "Ring"                     */
>
>                 default: goto ignore;
>                 }
> diff --git a/drivers/input/input-leds.c b/drivers/input/input-leds.c
> index 0b11990ade46..bc6e25b9af25 100644
> --- a/drivers/input/input-leds.c
> +++ b/drivers/input/input-leds.c
> @@ -33,6 +33,8 @@ static const struct {
>         [LED_MISC]      = { "misc" },
>         [LED_MAIL]      = { "mail" },
>         [LED_CHARGING]  = { "charging" },
> +       [LED_OFFHOOK]   = { "offhook" },

I am pretty sure this also needs to be reviewed by the led folks.
Adding them in Cc.

Cheers,
Benjamin

> +       [LED_RING]      = { "ring" },
>  };
>
>  struct input_led {
> diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
> index 225ec87d4f22..dd785a5b5076 100644
> --- a/include/uapi/linux/input-event-codes.h
> +++ b/include/uapi/linux/input-event-codes.h
> @@ -925,6 +925,8 @@
>  #define LED_MISC               0x08
>  #define LED_MAIL               0x09
>  #define LED_CHARGING           0x0a
> +#define LED_OFFHOOK            0x0b
> +#define LED_RING               0x0c
>  #define LED_MAX                        0x0f
>  #define LED_CNT                        (LED_MAX+1)
>
> --
> 2.32.0
>

