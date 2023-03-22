Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA1226C526B
	for <lists+linux-leds@lfdr.de>; Wed, 22 Mar 2023 18:25:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbjCVRZn (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 Mar 2023 13:25:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbjCVRZn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 Mar 2023 13:25:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8398F19BE
        for <linux-leds@vger.kernel.org>; Wed, 22 Mar 2023 10:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679505892;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DI9mYdoQcbq0a9RshtISxvNn6vWKroN9kzvNpIKmLUU=;
        b=Qj2Jb67ghxvvMRj1aULLruZ3aFeq3QdJgMJchaa/qmJ499iGo21tf3UdSb+QuGajp+iL15
        eVh3oQuSzRdtXopP9HHQ0Y5zn9IGLdfadLQYh6/GX1Qp94qPRL0l7ULitgrDMKKWrs/Bs7
        1zSkmWPlU7/vUkET+Bwhg05YuBVD06k=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-470-vayxTPMfPtWcLbv1j_ZdvA-1; Wed, 22 Mar 2023 13:24:51 -0400
X-MC-Unique: vayxTPMfPtWcLbv1j_ZdvA-1
Received: by mail-ed1-f72.google.com with SMTP id dn8-20020a05640222e800b004bd35dd76a9so28389399edb.13
        for <linux-leds@vger.kernel.org>; Wed, 22 Mar 2023 10:24:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679505890;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DI9mYdoQcbq0a9RshtISxvNn6vWKroN9kzvNpIKmLUU=;
        b=nLStZ/adyjg2o6IObBz6QdS+bN7JS4Z2ilo2Nam2vDxigkrzDDp9rCaLz9hq+dQWkh
         2sEQvbYZTU2Am5/E2+4cpsjwWIKQ5QMhhF3CrzWzafPYSjk+bEIdWi1AfP9xSKvmR/PL
         uiFx+c4PkJ0EgXLIkADTW5dv+RNtc8ePIe+qK7jqG6drN8ObZW5Hp2D/4MW9Kq9QMkEt
         r8a4EL7IRTUPYV7st+z8kmL6TouwaHf6xW/AAZ1jSgw9RAX165X9uNkup3gvjov83R78
         dsodLxUSccAIQS86dAYBXLYDRVhyQMHj+15bQbbmlKVLjq53yHIq035kAC/FtoVmNRIa
         dPzw==
X-Gm-Message-State: AO0yUKVdu2t0qBHlvZQhOqjk89cYDhrEwANLSn7OdtaSDA5KyS2SmJJh
        vB0GkumkS10c27HG48zxbQSeHjEe82AMtCbRWK4zrqPc7q04Oto6wgsgxVhXeGLuHoFH54DQt5h
        HxQ0mWwwor+qmmlcXLaxyEg==
X-Received: by 2002:a17:906:9bd3:b0:931:85f8:6d00 with SMTP id de19-20020a1709069bd300b0093185f86d00mr6583054ejc.47.1679505890374;
        Wed, 22 Mar 2023 10:24:50 -0700 (PDT)
X-Google-Smtp-Source: AK7set/iVOzwEtCBSm0BcTaZj/TqMVuTEs5AG1IzeThUKhMvbdX5pWNMSX6+SeFRhfJKZzJbxbk91Q==
X-Received: by 2002:a17:906:9bd3:b0:931:85f8:6d00 with SMTP id de19-20020a1709069bd300b0093185f86d00mr6583037ejc.47.1679505890092;
        Wed, 22 Mar 2023 10:24:50 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id u27-20020a50951b000000b004bf999f8e57sm8078740eda.19.2023.03.22.10.24.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 10:24:49 -0700 (PDT)
Message-ID: <98ec71dc-729b-4648-223c-6543e2efab39@redhat.com>
Date:   Wed, 22 Mar 2023 18:24:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 6/8] leds: tps68470: Support the WLED driver
Content-Language: en-US, nl
To:     Daniel Scally <dan.scally@ideasonboard.com>,
        linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc:     pavel@ucw.cz, lee@kernel.org, markgross@kernel.org,
        sboyd@kernel.org, hpa@redhat.com
References: <20230322160926.948687-1-dan.scally@ideasonboard.com>
 <20230322160926.948687-7-dan.scally@ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230322160926.948687-7-dan.scally@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

On 3/22/23 17:09, Daniel Scally wrote:
> The TPS68470 PMIC provides a third LED driver in addition to the two
> indicator LEDs. Add support for the WLED. To ensure the LED is active
> for as long as the kernel instructs it to be we need to re-trigger it
> periodically to avoid the IC's internal timeouts.
> 
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
>  drivers/leds/leds-tps68470.c | 102 ++++++++++++++++++++++++++++++++++-
>  include/linux/mfd/tps68470.h |  12 +++++
>  2 files changed, 113 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/leds-tps68470.c b/drivers/leds/leds-tps68470.c
> index 44df175d25de..abcd3494b1a8 100644
> --- a/drivers/leds/leds-tps68470.c
> +++ b/drivers/leds/leds-tps68470.c
> @@ -8,6 +8,7 @@
>   *	Kate Hsuan <hpa@redhat.com>
>   */
>  
> +#include <linux/clk.h>
>  #include <linux/leds.h>
>  #include <linux/mfd/tps68470.h>
>  #include <linux/module.h>
> @@ -15,7 +16,10 @@
>  #include <linux/platform_device.h>
>  #include <linux/property.h>
>  #include <linux/regmap.h>
> +#include <linux/workqueue.h>
>  
> +#define work_to_led(work) \
> +	container_of(work, struct tps68470_led, keepalive_work)
>  
>  #define lcdev_to_led(led_cdev) \
>  	container_of(led_cdev, struct tps68470_led, lcdev)
> @@ -26,20 +30,25 @@
>  enum tps68470_led_ids {
>  	TPS68470_ILED_A,
>  	TPS68470_ILED_B,
> +	TPS68470_WLED,
>  	TPS68470_NUM_LEDS
>  };
>  
>  static const char *tps68470_led_names[] = {
>  	[TPS68470_ILED_A] = "tps68470-iled_a",
>  	[TPS68470_ILED_B] = "tps68470-iled_b",
> +	[TPS68470_WLED] = "tps68470-wled",
>  };
>  
>  struct tps68470_led {
>  	unsigned int led_id;
>  	struct led_classdev lcdev;
> +	enum led_brightness state;
> +	struct work_struct keepalive_work;

The way this is used does not look very periodical, it seems to just run as fast as it can?

IMHO this should use a delayed-work item and then queue that to run at a certain interval.

>  };
>  
>  struct tps68470_device {
> +	struct clk *clk;
>  	struct device *dev;
>  	struct regmap *regmap;
>  	struct tps68470_led leds[TPS68470_NUM_LEDS];
> @@ -52,11 +61,33 @@ enum ctrlb_current {
>  	CTRLB_16MA	= 3,
>  };
>  
> +/*
> + * The WLED can operate in different modes, including a Flash and Torch mode. In
> + * each mode there's a timeout which ranges from a matter of milliseconds to up
> + * to 13 seconds. We don't want that timeout to apply though because the LED
> + * should be lit until we say that it should no longer be lit, re-trigger the
> + * LED periodically to keep it alive.
> + */
> +static void tps68470_wled_keepalive_work(struct work_struct *work)
> +{
> +	struct tps68470_device *tps68470;
> +	struct tps68470_led *led;
> +
> +	led = work_to_led(work);
> +	tps68470 = led_to_tps68470(led, led->led_id);
> +
> +	regmap_update_bits_async(tps68470->regmap, TPS68470_REG_WLEDCTL,
> +				 TPS68470_WLED_CTL_MASK, TPS68470_WLED_CTL_MASK);
> +	schedule_work(&led->keepalive_work);
> +}
> +
>  static int tps68470_brightness_set(struct led_classdev *led_cdev, enum led_brightness brightness)
>  {
>  	struct tps68470_led *led = lcdev_to_led(led_cdev);
>  	struct tps68470_device *tps68470 = led_to_tps68470(led, led->led_id);
>  	struct regmap *regmap = tps68470->regmap;
> +	const char *errmsg;
> +	int ret;
>  
>  	switch (led->led_id) {
>  	case TPS68470_ILED_A:
> @@ -65,8 +96,59 @@ static int tps68470_brightness_set(struct led_classdev *led_cdev, enum led_brigh
>  	case TPS68470_ILED_B:
>  		return regmap_update_bits(regmap, TPS68470_REG_ILEDCTL, TPS68470_ILEDCTL_ENB,
>  					  brightness ? TPS68470_ILEDCTL_ENB : 0);
> +	case TPS68470_WLED:
> +		/*
> +		 * LED core does not prevent re-setting brightness to its current
> +		 * value; we need to do so here to avoid unbalanced calls to clk
> +		 * enable/disable.
> +		 */
> +		if (led->state == brightness)
> +			return 0;
> +
> +		if (brightness) {
> +			schedule_work(&led->keepalive_work);
> +
> +			ret = clk_prepare_enable(tps68470->clk);
> +			if (ret) {
> +				errmsg = "failed to start clock\n";
> +				goto err_cancel_work;
> +			}
> +		} else {
> +			cancel_work_sync(&led->keepalive_work);
> +			clk_disable_unprepare(tps68470->clk);
> +		}
> +
> +		ret = regmap_update_bits(tps68470->regmap, TPS68470_REG_WLEDCTL,
> +					 TPS68470_WLED_EN_MASK,
> +					 brightness ? TPS68470_WLED_EN_MASK :
> +						      ~TPS68470_WLED_EN_MASK);
> +		if (ret) {
> +			errmsg = "failed to set WLED EN\n";
> +			goto err_disable_clk;
> +		}
> +
> +		ret = regmap_update_bits(tps68470->regmap, TPS68470_REG_WLEDCTL,
> +					 TPS68470_WLED_CTL_MASK,
> +					 brightness ? TPS68470_WLED_CTL_MASK :
> +						      ~TPS68470_WLED_CTL_MASK);
> +		if (ret) {
> +			errmsg = "failed to set WLED START\n";
> +			goto err_disable_clk;
> +		}
> +
> +		led->state = brightness;
> +		break;
> +	default:
> +		return dev_err_probe(led_cdev->dev, -EINVAL, "invalid LED ID\n");
>  	}
> -	return -EINVAL;
> +
> +	return ret;
> +
> +err_disable_clk:
> +	clk_disable_unprepare(tps68470->clk);
> +err_cancel_work:
> +	cancel_work_sync(&led->keepalive_work);
> +	return dev_err_probe(tps68470->dev, ret, errmsg);
>  }
>  
>  static enum led_brightness tps68470_brightness_get(struct led_classdev *led_cdev)
> @@ -88,6 +170,14 @@ static enum led_brightness tps68470_brightness_get(struct led_classdev *led_cdev
>  		value &= led->led_id == TPS68470_ILED_A ? TPS68470_ILEDCTL_ENA :
>  					TPS68470_ILEDCTL_ENB;
>  		break;
> +	case TPS68470_WLED:
> +		ret = regmap_read(regmap, TPS68470_REG_WLEDCTL, &value);
> +		if (ret)
> +			return dev_err_probe(led_cdev->dev, ret,
> +					     "failed to read LED status\n");
> +
> +		value &= TPS68470_WLED_CTL_MASK;
> +		break;
>  	default:
>  		return dev_err_probe(led_cdev->dev, -EINVAL, "invalid LED ID\n");
>  	}
> @@ -177,6 +267,11 @@ static int tps68470_leds_probe(struct platform_device *pdev)
>  	tps68470->dev = &pdev->dev;
>  	tps68470->regmap = dev_get_drvdata(pdev->dev.parent);
>  
> +	tps68470->clk = devm_clk_get(tps68470->dev, NULL);
> +	if (IS_ERR(tps68470->clk))
> +		return dev_err_probe(tps68470->dev, PTR_ERR(tps68470->clk),
> +				     "failed to get clock\n");
> +
>  	for (i = 0; i < TPS68470_NUM_LEDS; i++) {
>  		led = &tps68470->leds[i];
>  		lcdev = &led->lcdev;
> @@ -206,6 +301,11 @@ static int tps68470_leds_probe(struct platform_device *pdev)
>  			if (ret)
>  				goto err_exit;
>  		}
> +
> +		if (led->led_id == TPS68470_WLED) {
> +			INIT_WORK(&led->keepalive_work,
> +				  tps68470_wled_keepalive_work);
> +		}
>  	}
>  
>  	ret = tps68470_leds_init(tps68470);
> diff --git a/include/linux/mfd/tps68470.h b/include/linux/mfd/tps68470.h
> index 2d2abb25b944..103ff730e028 100644
> --- a/include/linux/mfd/tps68470.h
> +++ b/include/linux/mfd/tps68470.h
> @@ -35,6 +35,11 @@
>  #define TPS68470_REG_GPDI		0x26
>  #define TPS68470_REG_GPDO		0x27
>  #define TPS68470_REG_ILEDCTL		0x28
> +#define TPS68470_REG_WLEDMAXF		0x2F
> +#define TPS68470_REG_WLEDTO		0x30
> +#define TPS68470_REG_WLEDC1		0x34
> +#define TPS68470_REG_WLEDC2		0x35
> +#define TPS68470_REG_WLEDCTL		0x36
>  #define TPS68470_REG_VCMVAL		0x3C
>  #define TPS68470_REG_VAUX1VAL		0x3D
>  #define TPS68470_REG_VAUX2VAL		0x3E
> @@ -98,5 +103,12 @@
>  #define TPS68470_ILEDCTL_ENA		BIT(2)
>  #define TPS68470_ILEDCTL_ENB		BIT(6)
>  #define TPS68470_ILEDCTL_CTRLB		GENMASK(5, 4)
> +#define TPS68470_WLEDMAXF_MAX_CUR_MASK	GENMASK(4, 0)
> +#define TPS68470_WLEDC_ILED_MASK	GENMASK(4, 0)
> +#define TPS68470_WLED_MODE_MASK		GENMASK(1, 0)
> +#define TPS68470_WLED_EN_MASK		BIT(2)
> +#define TPS68470_WLED_DISLED1		BIT(3)
> +#define TPS68470_WLED_DISLED2		BIT(4)
> +#define TPS68470_WLED_CTL_MASK		BIT(5)
>  
>  #endif /* __LINUX_MFD_TPS68470_H */


Otherwise this LGTM.

Regards,

Hans

