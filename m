Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D98D50D0D
	for <lists+linux-leds@lfdr.de>; Mon, 24 Jun 2019 15:59:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727267AbfFXN73 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 24 Jun 2019 09:59:29 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:40377 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727806AbfFXN73 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 24 Jun 2019 09:59:29 -0400
Received: by mail-wr1-f67.google.com with SMTP id p11so14028935wre.7
        for <linux-leds@vger.kernel.org>; Mon, 24 Jun 2019 06:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=HZydg61kd/5ZMS5RbhbADXYMXbV4sPeJO33INEjYDBA=;
        b=cCn/f5WcbbLk18YiGYwGIt8mW7tsHJa6PwLBSZV9msR7EdDeabmbI8VfaREJiu6RVv
         GVP/y61EwmE4mAeQWElaSCBxcJwkJaYuASeFL0ZU001nLQZveinpCXX0KQB1NK63NOez
         KQk0I+BEK7epCJBbxY3uCLtC7T8rScva2GxHkYz86EdtrhNUuQWid0MjfLE17/fXM//1
         bre8itTEokJn39L306+8TEsR52h/mWEgO3Q64yiWrystgcP+ARYQHDL6JPEHCq7yamEc
         EjHkDyyLwUhpMlTnyebsq4Mz9xRaf9HkvF0hOaz1Jr3+SqZGbMRTeZTGkqg3vwu+3m70
         Lvwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=HZydg61kd/5ZMS5RbhbADXYMXbV4sPeJO33INEjYDBA=;
        b=Swayr3k73xULtd04aEP16eGX9Uq18i8I31TO7leLW8zKET20JCIHztKr8wTwVThPm3
         bWbhi4cfK2dBroOQ1mH0WWaePKydgLgiLsXDP+3Okxwpaya1CLDoF8F0wr7D23Edu0Dr
         SUjBMIH7SK6dVF0K3+0W+OKkZKghq66/VyULcmEq0ArJQzSsxocFEhJo/2f2Ok6pBSvv
         kl23498J0ak8wwV67hpC6mSZRjxO+us1bpMpy1F46BT/iPY/DAJCyfvamdhtkIZeQEpL
         lIQgaMrJnehzn4sdkKLrY3YIKpSK4L+4ZW2+fy1Hl2ADMqU0TS7MCUsHJYpruC9P9nhQ
         S8/g==
X-Gm-Message-State: APjAAAXmFZLOVziQRhkwDn03aeT3vaawsMUOT6qr88zL7SQywsQhSBE6
        CxlGYUZ8ZRjrnaRyauVDv0u5Iw==
X-Google-Smtp-Source: APXvYqyXl+oaJqy9dGnCwOyjNy47toUpLXcA2A7g32WAeammFUBUsdmAZWtzNQCfsd+Y2HZBQlSpLg==
X-Received: by 2002:adf:e2c7:: with SMTP id d7mr53801722wrj.272.1561384766167;
        Mon, 24 Jun 2019 06:59:26 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id r4sm9285460wrv.34.2019.06.24.06.59.24
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 24 Jun 2019 06:59:25 -0700 (PDT)
Date:   Mon, 24 Jun 2019 14:59:23 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Brian Dodge <bdodge09@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, lee.jones@linaro.org,
        jingoohan1@gmail.com, jacek.anaszewski@gmail.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, Peter Bacon <pbacon@psemi.com>
Subject: Re: [PATCH 2/3] backlight/arcxcnn fix vendor prefix
Message-ID: <20190624135923.ej6o2oooncocjwyn@holly.lan>
References: <1541592640-18478-1-git-send-email-bdodge09@gmail.com>
 <1541592640-18478-3-git-send-email-bdodge09@gmail.com>
 <20181111113053.GF27666@amd>
 <e372391c-1fd5-41ec-b766-7669fffb928d@gmail.com>
 <c4477220-7159-b5a8-16ea-4f4dbb645ced@linaro.org>
 <20190621221325.GA2343@amd>
 <20190624102405.gg2lnlw6wmfvjrxu@holly.lan>
 <9d590b7b-5477-249e-a482-1fc17d7a106f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9d590b7b-5477-249e-a482-1fc17d7a106f@gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Jun 24, 2019 at 07:29:20AM -0400, Brian Dodge wrote:
> This sure did fall through the cracks.
> 
> I confirmed with the vendor that there are no existing embedded DTS with the
> wrong name(s) in them before submitting this patch.
> 
> The new owner of this chip family, pSemi, just wanted me to wrap things up
> and support all of there chips (3) in a single driver and that was the
> extent of the work for me.  Since then the manager of the program there has
> also changed.  I assume they'd still want these changes in for completeness.
> 
> AFAIK, there were just some quibbles about the copyright date range.  Can
> you please help me push these patches in? It'll take me some time to get
> back in to where I left things  since its been so long.  I know its a bit
> messy but the DTS and driver changes need to be together to make sense so I
> couldn't really do an incremental patch sequence.
> 
> What is the next step?

The next step is getting the changes to DT bindings agreed. Until that
happens the patchset cannot move and right now now the thread for that
patch has feedback that was not replies to:
https://patchwork.kernel.org/patch/10675451/

The explanation of why it is safe to accept the change to the DT
bindings really should end up in the patch description rather than the
mail thread. It would probably also help to have a link to
https://lkml.org/lkml/2018/9/25/726 where it looks like arc versus
arctic was previously discussed.

The following might also be convenient for you:

  A quick web search for "arc,arc2c0608" suggests that the only public
  user is the Samsung Chromebook Plus and it is likely that this device
  will remain on the v4.4 kernel. For this reason we do not provide
  any deprecated fallback names based on "arc".


Daniel.

> 
> Brian
> 
> On 6/24/19 6:24 AM, Daniel Thompson wrote:
> > On Sat, Jun 22, 2019 at 12:13:25AM +0200, Pavel Machek wrote:
> > > Hi!
> > > 
> > > > [Sorry to those receiving this twice... had to dig this out from the
> > > > archives and sent it to the lists from the wrong mailer]
> > > > 
> > > > On 27/11/2018 00:44, Brian Dodge wrote:
> > > > > Thank you Pavel, that is a good point.
> > > > > 
> > > > > The chip vendor has indicated that there is no reason to maintain the
> > > > > old/improper prefix and wishes to go forward (only) with the "arctic"
> > > > > prefix and any existing dts files are or will be updated.
> > > > Looks like this patch series has fallen into the cracks a little.
> > > > 
> > > > I think I assumed this info would end in the description of patch v2 1/3 (in
> > > > order to answer Rob's feedback) and I sat and waited for a respin. On the
> > > > other hand... I didn't actually say that explicitly anywhere! So... I'd
> > > > recommend a respin perhaps with a small bit of text explaining how the
> > > > vendor can state that any existing dts files will be updated. This is a
> > > > peripheral device so these strings are probably embedded into OEM
> > > > devicetrees rather than exclusively under the control of the vendor.
> > > So in next email you give good reason not to apply this :-).
> > Afraid so... it was on page 2 of my google search so I did a quick
> > search, sent the first mail and then went back to my web browser.
> > 
> > It was at that moment that I decided a quick search wasn't enough and
> > decided to got a little deeper!
> > 
> > 
> > Daniel.
