Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 073F61A685E
	for <lists+linux-leds@lfdr.de>; Mon, 13 Apr 2020 16:51:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730892AbgDMOu6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 13 Apr 2020 10:50:58 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:20590 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730890AbgDMOu5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 13 Apr 2020 10:50:57 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586789456; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=uvf3bpTwOKniLL1tkFEZ8lUYaBxnlGE9DNXjmA347Xc=;
 b=JVE0Oy/nbYlWJ2cLaPDvDLUAfV066FdCQDNMkvnkmXf9zUeA08NlACv4BRhWZy1UZ2z2PdNJ
 BibB5/HMk3DptM0ViEtYVolDnwGEB99e5CvecAMiAncPyiZ8QujRhmoprcaDv9WynkXRILhO
 oIJaQ/M0oY6qo6qsQxeWZQZRU0k=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyJkODczOCIsICJsaW51eC1sZWRzQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e947c4a.7f33307f5ab0-smtp-out-n01;
 Mon, 13 Apr 2020 14:50:50 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 85830C433BA; Mon, 13 Apr 2020 14:50:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kgunda)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A50E3C433F2;
        Mon, 13 Apr 2020 14:50:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 13 Apr 2020 20:20:47 +0530
From:   kgunda@codeaurora.org
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Daniel Thompson <daniel.thompson@linaro.org>,
        Rob Herring <robh@kernel.org>, bjorn.andersson@linaro.org,
        jingoohan1@gmail.com, b.zolnierkie@samsung.com,
        dri-devel@lists.freedesktop.org, jacek.anaszewski@gmail.com,
        pavel@ucw.cz, mark.rutland@arm.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dan Murphy <dmurphy@ti.com>, linux-arm-msm@vger.kernel.org,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH V4 1/4] backlight: qcom-wled: convert the wled bindings to
 .yaml format
In-Reply-To: <20200406085024.GF30614@dell>
References: <1584985618-25689-1-git-send-email-kgunda@codeaurora.org>
 <1584985618-25689-2-git-send-email-kgunda@codeaurora.org>
 <20200331175401.GA9791@bogus>
 <ac8f25113a3bb233c11fd7cd9e62c2cf@codeaurora.org>
 <20200403114651.m6rholzufzqinanc@holly.lan> <20200406085024.GF30614@dell>
Message-ID: <4fb0643342e512a248f57198cbafe50c@codeaurora.org>
X-Sender: kgunda@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 2020-04-06 14:20, Lee Jones wrote:
> On Fri, 03 Apr 2020, Daniel Thompson wrote:
> 
>> On Fri, Apr 03, 2020 at 04:45:49PM +0530, kgunda@codeaurora.org wrote:
>> > On 2020-03-31 23:24, Rob Herring wrote:
>> > > On Mon, Mar 23, 2020 at 11:16:55PM +0530, Kiran Gunda wrote:
>> > > > diff --git
>> > > > a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
>> > > > b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
>> > > > new file mode 100644
>> > > > index 0000000..8a388bf
>> > > > --- /dev/null
>> > > > +++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
>> > > > @@ -0,0 +1,184 @@
>> > > > +# SPDX-License-Identifier: GPL-2.0-only
>> > > > +%YAML 1.2
>> > > > +---
>> > > > +$id: http://devicetree.org/schemas/leds/backlight/qcom-wled.yaml#
>> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> > > > +
>> > > > +title: Binding for Qualcomm Technologies, Inc. WLED driver
>> > > > +
>> > > > +maintainers:
>> > > > +  - Lee Jones <lee.jones@linaro.org>
>> > >
>> > > Should be the h/w owner (you), not who applies patches.
>> > >
>> > will address in next post.
>> > <snip>
>> > will address in next post.
>> > <snip>
>> > will address in next post.
>> > <snip>
>> > will address in next post.
>> > <snip>
>> > will address in next post.
>> > <snip>
>> > will address in next post.
>> > <snip>
>> > will address in next post.
>> > <snip>
>> > will address in next post.
>> > <snip>
>> > will address in next post.
>> 
>> If you agree on all points raised I doubt there is any need for a 
>> point
>> by point reply since everyone who reads it will have to scroll down
>> simply to find out that you agree on all points.
>> 
>> Better just to acknowledge the feedback and reply to the first one
>> saying you'll agree on all points and will address all feedback in the
>> next revision (and then trim the reply to keep it short).
> 
> Or better still, just submit the next revision with all the fixes. :)
Noted.
