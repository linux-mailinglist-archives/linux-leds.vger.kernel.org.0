Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55B6718F8B6
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2020 16:36:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727230AbgCWPgR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 23 Mar 2020 11:36:17 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:49632 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727124AbgCWPgQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 23 Mar 2020 11:36:16 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584977776; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=wijimHVzaAPkYdmKEb1ozTEK2M9kYeLXNSo3279w37s=;
 b=oXhjG3pJVS7H0WMJE+RAaLqMyLYC62nSjyMA8d+YMrKka9UWkI+mB+xMs8Bapas8+g3yYsPk
 jWl71odnIqMqcjP7pmeTTNSFpC4x8Y2YLAFs76JWvbEVPoyn605Z0hjtYuMnAnSltWb1gUCw
 Y4H1OIt3hSGR0bRB/JjAiSyf4aE=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJkODczOCIsICJsaW51eC1sZWRzQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e78d76c.7f9b3ececab0-smtp-out-n03;
 Mon, 23 Mar 2020 15:36:12 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9A551C432C2; Mon, 23 Mar 2020 15:36:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kgunda)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D7712C433D2;
        Mon, 23 Mar 2020 15:36:11 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 23 Mar 2020 21:06:11 +0530
From:   kgunda@codeaurora.org
To:     Daniel Thompson <daniel.thompson@linaro.org>
Cc:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        lee.jones@linaro.org, b.zolnierkie@samsung.com,
        dri-devel@lists.freedesktop.org, jacek.anaszewski@gmail.com,
        pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org,
        linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH V3 2/4] backlight: qcom-wled: Add callback functions
In-Reply-To: <20200311103047.v7rt5ii3saack22a@holly.lan>
References: <1583760362-26978-1-git-send-email-kgunda@codeaurora.org>
 <1583760362-26978-3-git-send-email-kgunda@codeaurora.org>
 <20200310152719.5hpzh6osq22y4qbn@holly.lan>
 <05ab744dfbd83b6704bd394ce3c3dfc9@codeaurora.org>
 <20200311103047.v7rt5ii3saack22a@holly.lan>
Message-ID: <45964027ff388aec97d27f579d96c012@codeaurora.org>
X-Sender: kgunda@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 2020-03-11 16:00, Daniel Thompson wrote:
> On Wed, Mar 11, 2020 at 12:11:00PM +0530, kgunda@codeaurora.org wrote:
>> On 2020-03-10 20:57, Daniel Thompson wrote:
>> > On Mon, Mar 09, 2020 at 06:56:00PM +0530, Kiran Gunda wrote:
>> > > Add cabc_config, sync_toggle, wled_ovp_fault_status and wled_ovp_delay
>> > > callback functions to prepare the driver for adding WLED5 support.
>> > >
>> > > Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
>> >
>> > Overall this code would a lot easier to review if
>> > > ---
>> > >  drivers/video/backlight/qcom-wled.c | 196
>> > > +++++++++++++++++++++++-------------
>> > >  1 file changed, 126 insertions(+), 70 deletions(-)
>> > >
>> > > diff --git a/drivers/video/backlight/qcom-wled.c
>> > > b/drivers/video/backlight/qcom-wled.c
>> > > index 3d276b3..b73f273 100644
>> > > --- a/drivers/video/backlight/qcom-wled.c
>> > > +++ b/drivers/video/backlight/qcom-wled.c
>> > > @@ -128,6 +128,7 @@ struct wled_config {
>> > >  	bool cs_out_en;
>> > >  	bool ext_gen;
>> > >  	bool cabc;
>> > > +	bool en_cabc;
>> >
>> > Does this ever get set to true?
>> >
>> Yes. If user wants use the cabc pin to control the brightness and
>> use the "qcom,cabc" DT property in the device tree.
> 
> That sounds like what you intended the code to do!
> 
> Is the code that does this present in the patch? I could not find
> it.
> 
okay... It's my bad. We already have the "cabc" for this. I will remove 
the en_cabc in
next series.
> 
> Daniel.
