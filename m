Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5138017D943
	for <lists+linux-leds@lfdr.de>; Mon,  9 Mar 2020 07:28:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726248AbgCIG2G (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 9 Mar 2020 02:28:06 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:21205 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726383AbgCIG2G (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 9 Mar 2020 02:28:06 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583735285; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=qy2xY/dZyMiOpfQufKuG+wtf2moSQrlU/AD39JqMigc=;
 b=Vq38FuJMRXGgVFGHjKoDGdbmFlV0d0l+TxXqH6daC079/wVPEDKzmD9BonFE8+NMYiGXltz4
 e2di05YJdl5O5VfDdlPViWbLtc8DaZixdLAhjMUYy0ME/TmzT/Xc7wq1CSWWJIUXSF+lIu4U
 ruyV+0KG5wCxycHum3rHBtvdDFE=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJkODczOCIsICJsaW51eC1sZWRzQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e65e1e6.7efdb514f340-smtp-out-n03;
 Mon, 09 Mar 2020 06:27:50 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 930BDC433BA; Mon,  9 Mar 2020 06:27:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kgunda)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E94B8C433D2;
        Mon,  9 Mar 2020 06:27:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 09 Mar 2020 11:57:48 +0530
From:   kgunda@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     jingoohan1@gmail.com, lee.jones@linaro.org,
        b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
        daniel.thompson@linaro.org, jacek.anaszewski@gmail.com,
        pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-fbdev@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH V1 2/2] backlight: qcom-wled: Add support for WLED5
 peripheral in PM8150L
In-Reply-To: <20200308214748.GL1094083@builder>
References: <1583153739-19170-1-git-send-email-kgunda@codeaurora.org>
 <1583153739-19170-3-git-send-email-kgunda@codeaurora.org>
 <20200308214748.GL1094083@builder>
Message-ID: <d0e681ae203bb14f4061d248b935578b@codeaurora.org>
X-Sender: kgunda@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 2020-03-09 03:17, Bjorn Andersson wrote:
> On Mon 02 Mar 04:55 PST 2020, Kiran Gunda wrote:
>> diff --git a/drivers/video/backlight/qcom-wled.c 
>> b/drivers/video/backlight/qcom-wled.c
> [..]
>> @@ -147,14 +187,39 @@ struct wled {
>>  	u32 max_brightness;
>>  	u32 short_count;
>>  	u32 auto_detect_count;
>> +	u32 version;
>>  	bool disabled_by_short;
>>  	bool has_short_detect;
>> +	bool cabc_disabled;
>>  	int short_irq;
>>  	int ovp_irq;
>> 
>>  	struct wled_config cfg;
>>  	struct delayed_work ovp_work;
>>  	int (*wled_set_brightness)(struct wled *wled, u16 brightness);
>> +	int (*cabc_config)(struct wled *wled, bool enable);
>> +	int (*wled_sync_toggle)(struct wled *wled);
> 
> Please split this patch in one that adds these and breaks out the wled3
> support, and then a second patch that adds wled5.
> 
Sure. Will make this change in the next post.
>> +};
>> +
> [..]
>> +static int wled5_set_brightness(struct wled *wled, u16 brightness)
>> +{
>> +	int rc, offset;
>> +	u16 low_limit = wled->max_brightness * 1 / 1000;
>> +	u8 v[2], brightness_msb_mask;
>> +
>> +	/* WLED5's lower limit is 0.1% */
>> +	if (brightness > 0 && brightness < low_limit)
>> +		brightness = low_limit;
>> +
>> +	brightness_msb_mask = 0xf;
>> +	if (wled->max_brightness == WLED5_SINK_REG_BRIGHT_MAX_15B)
>> +		brightness_msb_mask = 0x7f;
> 
> Why not just brightness &= wled->max_brightness? But given that it 
> seems
> like the framework ensures that brightness <= max_brightness, why not
> skip this altogether?
> 
Okay. I will modify the code to remove the min/max, low_limit checks in 
next post.
>> +
>> +	v[0] = brightness & 0xff;
>> +	v[1] = (brightness >> 8) & brightness_msb_mask;
>> +
>> +	offset = wled5_brightness_reg[wled->cfg.mod_sel];
>> +	rc = regmap_bulk_write(wled->regmap, wled->sink_addr + offset,
>> +			v, 2);
>> +	return rc;
>> +}
>> +
>>  static int wled4_set_brightness(struct wled *wled, u16 brightness)
>>  {
>>  	int rc, i;
>> @@ -237,7 +325,28 @@ static int wled_module_enable(struct wled *wled, 
>> int val)
>>  	return 0;
>>  }
>> 
>> -static int wled_sync_toggle(struct wled *wled)
>> +static int wled5_sync_toggle(struct wled *wled)
>> +{
>> +	int rc;
>> +	u8 val;
>> +
>> +	val = (wled->cfg.mod_sel == MOD_A) ? WLED5_SINK_REG_SYNC_MOD_A_BIT :
>> +					     WLED5_SINK_REG_SYNC_MOD_B_BIT;
>> +	rc = regmap_update_bits(wled->regmap,
>> +				wled->sink_addr + WLED5_SINK_REG_MOD_SYNC_BIT,
>> +				WLED5_SINK_REG_SYNC_MASK, val);
>> +	if (rc < 0)
>> +		return rc;
>> +
>> +	val = 0;
> 
> Just plug 0 in the function call.
> 
Sure. Will do it in next post.
>> +	rc = regmap_update_bits(wled->regmap,
>> +				wled->sink_addr + WLED5_SINK_REG_MOD_SYNC_BIT,
>> +				WLED5_SINK_REG_SYNC_MASK, val);
>> +
>> +	return rc;
> 
> And return regmap_update_bits(...);
> 
Sure. Will do it in next post.
>> +}
>> +
> 
> Regards,
> Bjorn
