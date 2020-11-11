Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 975652AFB70
	for <lists+linux-leds@lfdr.de>; Wed, 11 Nov 2020 23:36:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726704AbgKKWgb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 11 Nov 2020 17:36:31 -0500
Received: from mga18.intel.com ([134.134.136.126]:33550 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726849AbgKKWea (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 11 Nov 2020 17:34:30 -0500
IronPort-SDR: 34woNFekTSt7yXwKpFRDcMqVPFtkfRtKKAVS4bSYQdBW1a+whsvw/HrBVzqvK+rDHfOPYPYbyk
 nQOPPeNCU6JQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="158007732"
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="158007732"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 14:34:27 -0800
IronPort-SDR: SU7/jj73cH8OHcJfMMNDdjJtugVUOGtI7KwNjQIRxIXV3RX82nc+lvfKKuHPXCuGjJh0eu+tiB
 soQL+L1JWvfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="530391533"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga006.fm.intel.com with ESMTP; 11 Nov 2020 14:34:27 -0800
Received: from [10.215.242.65] (mreddy3x-MOBL.gar.corp.intel.com [10.215.242.65])
        by linux.intel.com (Postfix) with ESMTP id B9290580B99;
        Wed, 11 Nov 2020 14:34:24 -0800 (PST)
Subject: Re: [PATCH v1 2/2] leds: lgm: Add LED controller driver for LGM Soc
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, dmurphy@ti.com,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org, cheol.yong.kim@intel.com,
        qi-ming.wu@intel.com, malliamireddy009@gmail.com,
        yixin.zhu@intel.com
References: <c9c963a2d03fbd03bd21f71f3d776ac5800cf6cc.1604331498.git.mallikarjunax.reddy@linux.intel.com>
 <5372c8410909f7b6b020cd379980dbe4e30e31d3.1604331498.git.mallikarjunax.reddy@linux.intel.com>
 <20201105101123.GB7994@amd>
From:   "Reddy, MallikarjunaX" <mallikarjunax.reddy@linux.intel.com>
Message-ID: <ab22a281-6ee1-b357-83a1-b72433787442@linux.intel.com>
Date:   Thu, 12 Nov 2020 06:34:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201105101123.GB7994@amd>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel,

Thanks for your valuable comments. My comments inline.

On 11/5/2020 6:11 PM, Pavel Machek wrote:
> Hi!
>
>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>> index ed943140e1fd..6445b39fe4fc 100644
>> --- a/drivers/leds/Kconfig
>> +++ b/drivers/leds/Kconfig
>> @@ -886,6 +886,16 @@ config LEDS_SGM3140
>>   	  This option enables support for the SGM3140 500mA Buck/Boost Charge
>>   	  Pump LED Driver.
>>   
>> +config LEDS_LGM_SSO
>> +	tristate "LED support for Intel LGM SOC series"
>> +	depends on LEDS_CLASS
>> +	depends on MFD_SYSCON
>> +	depends on OF
>> +	help
>> +          Parallel to serial conversion, which is also called SSO controller,
>> +          can drive external shift register for LED outputs.
>> +	  This enables LED support for Serial Shift Output Controller(SSO).
> Something is wrong with indentation here.
Seems tabbing.. i will fix it.
>
>> diff --git a/drivers/leds/leds-lgm-sso.c b/drivers/leds/leds-lgm-sso.c
> Could we put it into drivers/leds/blink/ directory? You'll need to
> create it.
Sure, i will update in the next patch.
>
>> index 000000000000..f1bae1c6ed3c
>> --- /dev/null
>> +++ b/drivers/leds/leds-lgm-sso.c
>> @@ -0,0 +1,881 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Intel LGM Soc LED SSO driver
> Spell out LGM, SSO. Soc->SoC.
>
> Pointer to documentation would be welcome here.
  Public documentation is not available.
>
>> +enum {
>> +	US_SW = 0,
>> +	US_GPTC = 1,
>> +	US_FPID = 2
>> +};
> This is not really useful without additional comments.
ok, i will update the additional comments.
>
>> +static u32 sso_rectify_brightness(u32 brightness)
>> +{
>> +	if (brightness > LED_FULL)
>> +		return LED_FULL;
>> +	else
>> +		return brightness;
>> +}
> Why?
As per below review comments if we use "default-state" property, it will 
be redundant.
>
>> +static int sso_rectify_blink_rate(struct sso_led_priv *priv, u32 rate)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < MAX_FREQ_RANK; i++) {
>> +		if (rate <= priv->freq[i])
>> +			return i;
>> +	}
>> +
>> +	return i - 1;
>> +}
> Can return -1. Is that expected?
It return the frequency index, if 'rate' is not matching with 
'priv->freq' it will return maximum index.
In case of return -1 need to adjust the code in the function from where 
it is called.

func name 'sso_get_blink_rate_idx' is more appropriate i think.
>
>> +
>> +		desc->np = to_of_node(fwnode_child);
>> +		if (fwnode_property_read_string(fwnode_child, "label",
>> +						&desc->name)) {
>> +			dev_err(dev, "LED no label name!\n");
>> +			goto __dt_err;
>> +		}
> Can you use appropriate helper from the core? labels are getting
> deprecated...
Agree.
>
>
>> +		if (fwnode_property_present(fwnode_child,
>> +					    "retain-state-suspended"))
>> +			desc->retain_state_suspended = 1;
> Was this documented in the binding?
No, i will udpate.
>
>> +		if (fwnode_property_read_u32(fwnode_child, "intel,led-pin",
>> +					     &prop)) {
>> +			dev_err(dev, "Failed to find led pin id!\n");
>> +			goto __dt_err;
> Would not we normally use something like reg = <x> to indicate pin?
Yes, we can do that. i will update in the next patch.
>
>> +		if (fwnode_property_present(fwnode_child,
>> +					    "intel,sso-hw-trigger"))
>> +			desc->hw_trig = 1;
> Should not that be selectable on runtime?
Agree, i will fix this.
>
>> +		if (fwnode_property_read_u32(fwnode_child,
>> +					     "intel,sso-brightness", &prop))
>> +			desc->brightness = priv->brightness;
>> +		else
>> +			desc->brightness = sso_rectify_brightness(prop);
> Can you look at "default-state" property?
sure. i will  update with "default-state" property
>
>> +	ret = sso_gpio_gc_init(dev, priv);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
>> +}
> Just return ret.
ok.
>
>> +
>> +	ret = clk_prepare_enable(priv->gclk);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to prepate/enable sso gate clock!\n");
>> +		return ret;
>> +	}
>> +
>> +	priv->fpid_clk = devm_clk_get(dev, "fpid");
>> +	if (IS_ERR(priv->fpid_clk)) {
>> +		dev_err(dev, "Failed to get fpid clock!\n");
>> +		return PTR_ERR(priv->fpid_clk);
>> +	}
> clk disable here?
ok. i will use devm_add_action_or_reset to disable clocks.
>
>> +	ret = clk_prepare_enable(priv->fpid_clk);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to prepare/enable fpid clock!\n");
>> +		return ret;
>> +	}
>> +	priv->fpid_clkrate = clk_get_rate(priv->fpid_clk);
>> +
>> +	priv->mmap = syscon_node_to_regmap(dev->of_node);
>> +	if (IS_ERR(priv->mmap)) {
>> +		dev_err(dev, "Failed to map iomem!\n");
>> +		return PTR_ERR(priv->mmap);
>> +	}
> clk disable here? ... and probably elsewhere?
ok. i will use devm_add_action_or_reset to disable clocks.
>
> Best regards,
> 							Pavel
