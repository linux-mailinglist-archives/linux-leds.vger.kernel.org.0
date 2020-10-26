Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28B1C2985E6
	for <lists+linux-leds@lfdr.de>; Mon, 26 Oct 2020 04:26:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1421906AbgJZD0V (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 25 Oct 2020 23:26:21 -0400
Received: from mail-ot1-f48.google.com ([209.85.210.48]:34269 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1421905AbgJZD0U (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 25 Oct 2020 23:26:20 -0400
Received: by mail-ot1-f48.google.com with SMTP id k3so6236639otp.1
        for <linux-leds@vger.kernel.org>; Sun, 25 Oct 2020 20:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=APJhvRVtZKon4n+L+qr1in7tXFDpqdYlFgLS4+MGGBg=;
        b=b4lRYCVBFI0+oVR/v9mnMkkN2lMqHlmJ9KuqkCXoruEx9go1Hf2hZ/vF+icCuCRqzc
         xKfEgTT1dbFQM5qdXS2MYac39qmsSlkUvTV1ITMYTKFlpR+crQd/ocvV+gOzYBamhPmR
         ky+DKKDcdHbzy1BdZJKxxbiXYl1KQeLe8pwGIw0DLPwGoXDBZV8PsAuubHWRJj2wc9Xd
         gwu+rw+kCimUAwCVj1eYq3sfY6dMtMCcpmZQhkQ4XhhjQ73ZcfnfU7iJjCySQnip9C/e
         mmTkYr6+uTQTjB0jsfpncxvWV8dY0wAvzkYpPhwco8q1t6narskJh5WMaDpxjbcLaNlf
         7gSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=APJhvRVtZKon4n+L+qr1in7tXFDpqdYlFgLS4+MGGBg=;
        b=MoQzOqBzD5uE8xz8o3l84b/VdRPc5SI+SbpPZwC7iQQf5OjaaoYD7wEIl6dGTEGP+T
         f/jjZHPsB47l4EjiP8919YxAzzc9SuKZ8rvdSFwOdlnqFdmJeIlgeDXBz+4lR6mnCOqM
         uIMNcrWbSZJPmA/UOj3qH6q3AFUOjMVzyWyvEJOo9cOlMkMoOW+2cyLhPlmk2XJ7xiRv
         tirPA65JrAYx2K8CLWtfEDgjWtaZVl5V8QoxrWJGlFzEZzO/g1JBrTagaTyNDnaxfB6M
         xxJzrdqbHO8mtK2UPXtZD08xaEHPgF60ZlnGx6QN/wXUkXUsURke3y3Xzmb9BhURrfgl
         To/Q==
X-Gm-Message-State: AOAM5311DETmhC+9082+jB3/SOGDuM6IyuJCDN1TgfgSgP/i3EI9BYZF
        2ip6Fu+zOONprb01S0iz87F9HSNaoc6+GQ==
X-Google-Smtp-Source: ABdhPJyxcvgGrPRhHO6t622ewQPmhNfhDzpUsE2bhAgxnoaqUxlnOecbS0p6U3yo+EBnttNnzNrMdg==
X-Received: by 2002:a9d:da7:: with SMTP id 36mr12939705ots.288.1603682778238;
        Sun, 25 Oct 2020 20:26:18 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id n18sm2623524ota.23.2020.10.25.20.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2020 20:26:17 -0700 (PDT)
Date:   Sun, 25 Oct 2020 22:26:15 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Luca Weiss <luca@z3ntu.xyz>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>
Subject: Re: Clarification regarding multicolor leds
Message-ID: <20201026032615.GF12646@builder.lan>
References: <24145961.oFyDssk0vh@g550jk>
 <534b4937-b7ec-fc63-325a-c8e1e268b85b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <534b4937-b7ec-fc63-325a-c8e1e268b85b@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat 24 Oct 14:34 CDT 2020, Jacek Anaszewski wrote:

> Hi Luca,
> 
> On 10/24/20 12:48 AM, Luca Weiss wrote:
> > Hi,
> > I'm currently experimenting with the qcom lpg[0] which is a driver for the rgb
> > notification led found on e.g. Snapdragon 801 devices (and many more),
> > specifically my example is about the Fairphone 2 (msm8974-fairphone-fp2).
> > 
> > [0] https://lore.kernel.org/lkml/20201021201224.3430546-1-bjorn.andersson@linaro.org/
> > 
> > My dts is looking like the following (abbreviated):
> > 
> >      [in lpg node]
> >      multi-led {
> >          color = <LED_COLOR_ID_MULTI>;
> >          function = LED_FUNCTION_STATUS;
> >          ....
> >      };
> > 
> > I'm comparing this to the PinePhone where the leds are defined as follows:
> > 
> >      [in gpio-leds node]
> >      blue {
> >          function = LED_FUNCTION_INDICATOR;
> >          color = <LED_COLOR_ID_BLUE>;
> >      };
> >      green {
> >          function = LED_FUNCTION_INDICATOR;
> >          color = <LED_COLOR_ID_GREEN>;
> >      };
> >      red {
> >          function = LED_FUNCTION_INDICATOR;
> >          color = <LED_COLOR_ID_RED>;
> >      };
> > 
> > (sidenote: the LED_FUNCTION_INDICATOR should probably also be
> > LED_FUNCTION_STATUS there; the dts was made before the better descriptions for
> > the defines have been added)
> > 
> > This gets the following directories created in /sys/class/leds/:
> > 
> >      blue:indicator
> >      green:indicator
> >      red:indicator
> > 
> > But with the multicolor led on the Fairphone 2 only a directory with the name
> > of "multi-led" gets created which I would have expected to be
> > "multicolor:status" instead.
> 
> This is because the driver from patch set [0] does not use *ext()
> multicolor registration API, but follows old-fashion LED name
> initialization via 'name' property of struct led_classdev, which is
> initialized to DT 'label' value or DT node name if the former is absent.
> 

Sorry, I had missed this advancement. I will update the LPG patches to
add this and to switch to expect LED_COLOR_ID_RGB instead of multi.

Thanks,
Bjorn
