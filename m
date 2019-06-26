Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43F0356A48
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2019 15:22:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727492AbfFZNWS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 26 Jun 2019 09:22:18 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33446 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726628AbfFZNWR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 26 Jun 2019 09:22:17 -0400
Received: by mail-wr1-f66.google.com with SMTP id n9so2757619wru.0
        for <linux-leds@vger.kernel.org>; Wed, 26 Jun 2019 06:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=cuxtZ9Aae3DH1NJCfDMKnoPl+FBHAa2h/EExjT0fQNc=;
        b=KGHXnME8o1CNzuLsNPnksWtUosw23qQsHaBKXq7l1B7ki3v5PtB9qp1S2vlfHrc9jj
         SXdwe77palkdFKReSxHp+34zIFIX60YKsS3Za8CENaN7Xc8mWa2p39JJw5gT043pKVSP
         Re0bvBqiAnJGmlUNu5jzeFx82sJo5RKtEZh0hwm8U+Ov0mYzkWnFXQMgWVhlCEw9Vrph
         tcxtM3p+ojk81iUVnyYM2+PzCn6Iw22csDFhJ9TdGFkAtuf025EW/xyVtFVMehffxiXZ
         /8GW+qcbApofZG59odL2ArxowKdnQIHafbR+o99bCvHOXZQqoEUwcRcyTYsT6Mq4l28C
         ZJVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=cuxtZ9Aae3DH1NJCfDMKnoPl+FBHAa2h/EExjT0fQNc=;
        b=CCVt985aVBYFLTq1c9sKwqrnD38wB/Rvyy32eCuNTwqMNQR8CgGhyyKmbXxEHxaP61
         N3BazwiRYIob6OwDQuEVwpdORndliNvxJqcV9EIwowGJQObRaWoiMEvOUTeGHicV+65W
         bpPewIbLr5U4qkPz3o6a51lYRWoA5RUBMY5imy7Yd6Q4c4vVsPsArtsUB08cdTrFHOZw
         TMqO9A+muZAKVEIlX0jUTofcatM4KVF3tqI/Oc5OEWfoMPBJchfs10RVp9IaqoDpd6E9
         dhmL69NKzIUcfr54vbTbdeZ+oZ6L3SPxTLDZaJaxrdwe6GKhn52oSThcRRIE4w0VG4Wv
         juIg==
X-Gm-Message-State: APjAAAUg0P3hGZ5up2FnihnKxJp1UuyhCgcD+9qShdVrWGU1cDySqBH9
        lj8UCfQ+whkr6iMzBclULaddnQ==
X-Google-Smtp-Source: APXvYqzycz2lKwnCYPycV/KI1zIZm5ZA2Kw7FmtYekLbuzv56bWJYZ2WZIyiB7E3oEK8U8XQ2vtJlw==
X-Received: by 2002:a5d:4c87:: with SMTP id z7mr2629049wrs.58.1561555335964;
        Wed, 26 Jun 2019 06:22:15 -0700 (PDT)
Received: from dell ([2.27.35.164])
        by smtp.gmail.com with ESMTPSA id y133sm3197821wmg.5.2019.06.26.06.22.14
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Jun 2019 06:22:15 -0700 (PDT)
Date:   Wed, 26 Jun 2019 14:22:13 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Daniel Thompson <daniel.thompson@linaro.org>
Cc:     Brian Dodge <bdodge09@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        jingoohan1@gmail.com, jacek.anaszewski@gmail.com,
        robh+dt@kernel.org, dri-devel@lists.freedesktop.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        pbacon@psemi.com
Subject: Re: [PATCH 1/2] dt-bindings: backlight: fix vendor prefix for
 ArcticSand arcxcnn driver bindings
Message-ID: <20190626132213.GX21119@dell>
References: <1561435529-7835-1-git-send-email-bdodge09@gmail.com>
 <1561435529-7835-2-git-send-email-bdodge09@gmail.com>
 <20190625085534.xf2ullyju3ewbgik@holly.lan>
 <CAFaGBPnH=75=wJRM4EX9MYR8MSehEa2_hBEOsqo-DZvD6c6f_A@mail.gmail.com>
 <20190626105614.ujmryi7qou2ra7aq@holly.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190626105614.ujmryi7qou2ra7aq@holly.lan>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, 26 Jun 2019, Daniel Thompson wrote:

> On Tue, Jun 25, 2019 at 07:44:06AM -0400, Brian Dodge wrote:
> > I would like to deprecate the old prefix in the future after communicating
> > with all chip customers, which is why the old prefix is not documented in
> > the new bindings.
> 
> Deprecation is fine (by me at least) it's just that I'm not sure that
> removing the documentation for the deprecated bindings is the right way
> to do it. What is the prior art here?

I'd let Rob et al. make the final decision.
-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
