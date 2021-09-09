Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DA5F404577
	for <lists+linux-leds@lfdr.de>; Thu,  9 Sep 2021 08:11:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352340AbhIIGMm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 9 Sep 2021 02:12:42 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:48052 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1352215AbhIIGMl (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 9 Sep 2021 02:12:41 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631167893; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Tu9VJTw14yYLG7InUDLYuIOAxq1clJaEA5jlZQFtMp0=;
 b=qQ/2cFIg7o+JQuY3B9OlNolQ7JRX3EbX6QXMJOSD3n5K7G6bOs332TUuu6MlJ402YQYtgVDw
 UUXjXPmKyFya27fUMh09JTe9opUihOS6ayVwWn/2YaJqDMd17kpQuRlMkeXi55sWdkEkof07
 aQZZ7pHr2C6nZecYvJmApuI4FEA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkODczOCIsICJsaW51eC1sZWRzQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 6139a594ea875192307bb222 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 09 Sep 2021 06:11:32
 GMT
Sender: skakit=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E3D53C4360D; Thu,  9 Sep 2021 06:11:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CB483C4338F;
        Thu,  9 Sep 2021 06:11:29 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 09 Sep 2021 11:41:29 +0530
From:   skakit@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, swboyd@chromium.org,
        kgunda@codeaurora.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: pm8350c: Add pwm support
In-Reply-To: <YTjuGVOmzkTot8z1@ripper>
References: <1630924867-4663-1-git-send-email-skakit@codeaurora.org>
 <1630924867-4663-4-git-send-email-skakit@codeaurora.org>
 <YTeskY7kXsdmvGPp@google.com>
 <b10e5f36fb0216a4c951d752f5103099@codeaurora.org>
 <YTjW9LAGhTuszoa4@google.com> <YTjuGVOmzkTot8z1@ripper>
Message-ID: <667da76fe38a67af196e8dad00decd71@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 2021-09-08 22:38, Bjorn Andersson wrote:
> On Wed 08 Sep 08:29 PDT 2021, Matthias Kaehlcke wrote:
> 
>> On Wed, Sep 08, 2021 at 02:37:39PM +0530, skakit@codeaurora.org wrote:
>> > On 2021-09-07 23:46, Matthias Kaehlcke wrote:
>> > > On Mon, Sep 06, 2021 at 04:11:07PM +0530, satya priya wrote:
>> > > > Add pwm support for PM8350C pmic.
>> > > >
>> > > > Signed-off-by: satya priya <skakit@codeaurora.org>
>> > > > ---
>> > > >  arch/arm64/boot/dts/qcom/pm8350c.dtsi | 6 ++++++
>> > > >  1 file changed, 6 insertions(+)
>> > > >
>> > > > diff --git a/arch/arm64/boot/dts/qcom/pm8350c.dtsi
>> > > > b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
>> > > > index e1b75ae..ecdae55 100644
>> > > > --- a/arch/arm64/boot/dts/qcom/pm8350c.dtsi
>> > > > +++ b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
>> > > > @@ -29,6 +29,12 @@
>> > > >  			interrupt-controller;
>> > > >  			#interrupt-cells = <2>;
>> > > >  		};
>> > > > +
>> > > > +		pm8350c_pwm4: pwm {
>> > >
>> > > What does the '4' represent, an internal channel number? It should
>> > > probably be omitted if the PM8350 only has a single output PWM
>> > > port.
>> > >
>> >
>> > pm8350c has four PWMs, but I think we can drop the '4' here.
>> 
>> Why is only one PWM exposed if the PMIC has for of them? Why number 4
>> and not one of the others?
> 

pwm4 is used for backlight support on kodiak crd board, so I mentioned 
4, thinking 4 nodes should be present for 4 pwms.
but I see that we need to represent all the four channels as one node. 
will drop the '4' in next version.

Thanks,
Satya Priya

> The node should represent all 4 channels, which ones the board uses is
> captured in how they are bound to other clients - or defines as LEDs by
> additional child nodes.
> 
> Regards,
> Bjorn
