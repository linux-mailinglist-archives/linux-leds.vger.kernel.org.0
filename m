Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36E78508D8
	for <lists+linux-leds@lfdr.de>; Mon, 24 Jun 2019 12:26:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728489AbfFXKYK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 24 Jun 2019 06:24:10 -0400
Received: from mail-wr1-f54.google.com ([209.85.221.54]:40614 "EHLO
        mail-wr1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728330AbfFXKYK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 24 Jun 2019 06:24:10 -0400
Received: by mail-wr1-f54.google.com with SMTP id p11so13267735wre.7
        for <linux-leds@vger.kernel.org>; Mon, 24 Jun 2019 03:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=aK8XkDlL7MMc2zv2AaSwKO+X0HQ+yOPhxOZQGinvgYc=;
        b=kUFxXEBJvfFjSUQEw/fxMb9WsI7+QgHIBeKYcO5L8+mOlcw4o2dLdtCb9Y+AWPOzQh
         790jPCWgwJ5vmGvpzZgLLc7rvYs1rs7j0EPKSjkrCJd/TCNJo6j31ft3gKPOWXXHRxaj
         t2Q59z59gdmcmVADPrvxZYFmploRfJnDS0Aqax4g4DMhJOJ8mZHfVtdM2nKhE0zofhk7
         XWw5VLGiNc4NPty6MR1ESKbyOTRVBzL40tdcRC6835BtNFiDTX4YvNscBxoOhaXIXrC2
         6h9iarYszg0tOxs9xifkeHlV3EWnZslKC1RBZSu2GH3rBmUDsF8JZEdGIx7R14CRmFjD
         meVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aK8XkDlL7MMc2zv2AaSwKO+X0HQ+yOPhxOZQGinvgYc=;
        b=hWeVW2Xj7rVbSTWiIAKDUNy0XXsxFybbVjUmxa3Uz8+2bUHC8L/r7s1UXJy/WJrYMB
         xhXikydwfGUf+NwqrX3KX8q/4alOAlm35cEbE3+Q6zGEQgobxmv/x12ppDWtTR58xoID
         CmF8f+7B+q4qtPHrShPNJW6MCH8YkGbSVmzW4uKhvHgmhxQqri4mfUlNgKHfLB2Q63TP
         Dxrbvgc6HuqzfjcoOS0KeLYRh55SICmMZV3765AlTmJjTnBt5trrZ31DmMT/e25Xh5lp
         Ip8WQ+gPlx1Uz9uHc/bTUJ/7PRviRkTO1Lhtv4dH7cK4rCtd5Cl3wcbodjRsTEEYoDdz
         xZlA==
X-Gm-Message-State: APjAAAUI4RpN3Y60h/VC4AbARbJYHkAMAyHpfXfAKJV5mwFbj7a9L5+w
        Uw6EaUbZ2YFC90qPr3nqQ1llhA==
X-Google-Smtp-Source: APXvYqzTMeWorFbZD/xA4jLN9mvDivMcGHns6J6XG042zkNh+ouInszrIm7hm6X0cgedvvVH0PpqfQ==
X-Received: by 2002:a5d:66ce:: with SMTP id k14mr43881869wrw.308.1561371847706;
        Mon, 24 Jun 2019 03:24:07 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id y19sm14127474wmc.21.2019.06.24.03.24.06
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 24 Jun 2019 03:24:07 -0700 (PDT)
Date:   Mon, 24 Jun 2019 11:24:05 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Brian Dodge <bdodge09@gmail.com>, lee.jones@linaro.org,
        jingoohan1@gmail.com, jacek.anaszewski@gmail.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, Peter Bacon <pbacon@psemi.com>
Subject: Re: [PATCH 2/3] backlight/arcxcnn fix vendor prefix
Message-ID: <20190624102405.gg2lnlw6wmfvjrxu@holly.lan>
References: <1541592640-18478-1-git-send-email-bdodge09@gmail.com>
 <1541592640-18478-3-git-send-email-bdodge09@gmail.com>
 <20181111113053.GF27666@amd>
 <e372391c-1fd5-41ec-b766-7669fffb928d@gmail.com>
 <c4477220-7159-b5a8-16ea-4f4dbb645ced@linaro.org>
 <20190621221325.GA2343@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190621221325.GA2343@amd>
User-Agent: NeoMutt/20180716
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, Jun 22, 2019 at 12:13:25AM +0200, Pavel Machek wrote:
> Hi!
> 
> > [Sorry to those receiving this twice... had to dig this out from the
> > archives and sent it to the lists from the wrong mailer]
> > 
> > On 27/11/2018 00:44, Brian Dodge wrote:
> > >Thank you Pavel, that is a good point.
> > >
> > >The chip vendor has indicated that there is no reason to maintain the
> > >old/improper prefix and wishes to go forward (only) with the "arctic"
> > >prefix and any existing dts files are or will be updated.
> > 
> > Looks like this patch series has fallen into the cracks a little.
> > 
> > I think I assumed this info would end in the description of patch v2 1/3 (in
> > order to answer Rob's feedback) and I sat and waited for a respin. On the
> > other hand... I didn't actually say that explicitly anywhere! So... I'd
> > recommend a respin perhaps with a small bit of text explaining how the
> > vendor can state that any existing dts files will be updated. This is a
> > peripheral device so these strings are probably embedded into OEM
> > devicetrees rather than exclusively under the control of the vendor.
> 
> So in next email you give good reason not to apply this :-).

Afraid so... it was on page 2 of my google search so I did a quick
search, sent the first mail and then went back to my web browser.

It was at that moment that I decided a quick search wasn't enough and
decided to got a little deeper!


Daniel.
