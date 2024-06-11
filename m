Return-Path: <linux-leds+bounces-1874-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9EF9037BE
	for <lists+linux-leds@lfdr.de>; Tue, 11 Jun 2024 11:24:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8835A1F298EE
	for <lists+linux-leds@lfdr.de>; Tue, 11 Jun 2024 09:24:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E837117C225;
	Tue, 11 Jun 2024 09:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UevoCbxA"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A5717B437
	for <linux-leds@vger.kernel.org>; Tue, 11 Jun 2024 09:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718097695; cv=none; b=CWIww58BC/QFtgJ6VXVgzsDrXntt96+6IBiFkMNmbUr93l7cmREwErZJtQGXY4TiWxSjVqgA3aLdYeO/UZYUZ+FUbRs3Fjus7FL/MueB27ysgz7CzsKOIt4fJvg0LovmHoBAUjW3pR3XDt/xiDFb8XTv0PbFANPADyDObciwRD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718097695; c=relaxed/simple;
	bh=YDxxVy17GzQ25SND5tlc23Cufkpf/YLGDJ9a/s3A1+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hcKDtebYSLc+ZBuPw7pJMKw1G4GdOtjROiAmQjOq1NPQvtPfESwV6DGV7Tq9v7wepoVXu4GBuRN212WeGcCAe7d5s2IVPDdJXTuQwTJNBIXQSRHhxb/o0NtExPFCzGPQXYMLGnlL9GT2zXD8LikKhuwwWdAHkxmkec3DgQBu8mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UevoCbxA; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42178999284so7134335e9.0
        for <linux-leds@vger.kernel.org>; Tue, 11 Jun 2024 02:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718097692; x=1718702492; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KLRvrux7qnuomkpefvTqVWRMw/08JADT/EH5MpXik2s=;
        b=UevoCbxACtUFwTnzm8S8+iQ5iyDq22jJMcX0J+S9NYRuXpKtXu4GDuKccwKxg42lWX
         T2znkLQhriivq/gsb9uE4j09LQN3BZFev2IHNHSrYErTX99dgjbNu6jFx3cfJkvzL7Xt
         JzMT1Eo74F+FDGVa0maerXhwOU6kOrFTUs4n2HL8qaEwpRfbGg6eb93+REyN5z0EDcN5
         /C9AcZ4krI/vQokD3RpQlMHxUCmyw4MovOdgQFUXZWhOcAhCKGjcvK/OBLtAU/sxNHVZ
         Cw5cv3stmsSqUHvgD1mLIzmpGh+0Uw0R4o4Y6Zpq/67jaY/CAcTLgQLiO7CBTLYa6d7Z
         i22g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718097692; x=1718702492;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KLRvrux7qnuomkpefvTqVWRMw/08JADT/EH5MpXik2s=;
        b=Ko8A8Jx8/BYBaaKd8+fltBgyGvDOSPEz0kvwU19E2RZ5OsrqKkWw8BLnRyOWnhjOs6
         WAOVcUxKlLfbJJEygBR7tISYHwwerzDm1JDQKliGTt+QY2rBS2e5v6TdLiyvsxuuvhK5
         s2n27Wi6mWfNGMM8W75hVAgH4DIiODBYGruetoGXD1U+YLx2JW7P/8qAAKrSPdZ0Nth1
         wJgBss3kowahV9RwVUzbYB6xVwZfWGy8vKeo60rsqVQFrEf/VVsOUHJWq3k4ldh4an75
         7s6qJ5tCD1LmK+K7y/wOqmr6kML4RRiSWoacQP10V12KdIUt0u99lcbzZinH8XTvOjyN
         8hXQ==
X-Gm-Message-State: AOJu0YzkaEYcR0XoYX/Z2JBSC0c9iW7iE8PAsT5spiWye0hQnq543Bp7
	4OQgbxCGnyTdHNe5VM2e1JZ0DutqVkr6uw9zYnX+WxSnxK2DDC5bq143hEnHsMw=
X-Google-Smtp-Source: AGHT+IEepGFsOKuv3yoDSNT5PmXTkBEpR3DvFj7IynrBIPKJySCq5T7sECy6hhcePgMK9M6Hy943YA==
X-Received: by 2002:a05:600c:4e08:b0:421:c65a:738 with SMTP id 5b1f17b1804b1-421c65a0db9mr43755755e9.37.1718097692133;
        Tue, 11 Jun 2024 02:21:32 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4217de88933sm104268215e9.44.2024.06.11.02.21.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jun 2024 02:21:31 -0700 (PDT)
Message-ID: <c510fd3f-a55a-4ac9-bbc1-d2392027724c@linaro.org>
Date: Tue, 11 Jun 2024 11:21:30 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/2] leds: add mp3326 driver
To: Yuxi Wang <Yuxi.Wang@monolithicpower.com>, pavel@ucw.cz, lee@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 wyx137120466@gmail.com
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240611083236.1609-1-Yuxi.Wang@monolithicpower.com>
 <20240611083236.1609-3-Yuxi.Wang@monolithicpower.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTRLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+wsGUBBMBCgA+FiEE
 m9B+DgxR+NWWd7dUG5NDfTtBYpsFAmI+BxMCGwMFCRRfreEFCwkIBwIGFQoJCAsCBBYCAwEC
 HgECF4AACgkQG5NDfTtBYptgbhAAjAGunRoOTduBeC7V6GGOQMYIT5n3OuDSzG1oZyM4kyvO
 XeodvvYv49/ng473E8ZFhXfrre+c1olbr1A8pnz9vKVQs9JGVa6wwr/6ddH7/yvcaCQnHRPK
 mnXyP2BViBlyDWQ71UC3N12YCoHE2cVmfrn4JeyK/gHCvcW3hUW4i5rMd5M5WZAeiJj3rvYh
 v8WMKDJOtZFXxwaYGbvFJNDdvdTHc2x2fGaWwmXMJn2xs1ZyFAeHQvrp49mS6PBQZzcx0XL5
 cU9ZjhzOZDn6Apv45/C/lUJvPc3lo/pr5cmlOvPq1AsP6/xRXsEFX/SdvdxJ8w9KtGaxdJuf
 rpzLQ8Ht+H0lY2On1duYhmro8WglOypHy+TusYrDEry2qDNlc/bApQKtd9uqyDZ+rx8bGxyY
 qBP6bvsQx5YACI4p8R0J43tSqWwJTP/R5oPRQW2O1Ye1DEcdeyzZfifrQz58aoZrVQq+innR
 aDwu8qDB5UgmMQ7cjDSeAQABdghq7pqrA4P8lkA7qTG+aw8Z21OoAyZdUNm8NWJoQy8m4nUP
 gmeeQPRc0vjp5JkYPgTqwf08cluqO6vQuYL2YmwVBIbO7cE7LNGkPDA3RYMu+zPY9UUi/ln5
 dcKuEStFZ5eqVyqVoZ9eu3RTCGIXAHe1NcfcMT9HT0DPp3+ieTxFx6RjY3kYTGLOwU0EVUNc
 NAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDyfv4dEKuCqeh0
 hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOGmLPRIBkXHqJY
 oHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6H79LIsiYqf92
 H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4argt4e+jum3Nwt
 yupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8nO2N5OsFJOcd
 5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFFknCmLpowhct9
 5ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz7fMkcaZU+ok/
 +HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgNyxBZepj41oVq
 FPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMip+12jgw4mGjy
 5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYCGwwWIQSb0H4O
 DFH41ZZ3t1Qbk0N9O0FimwUCYDzvagUJFF+UtgAKCRAbk0N9O0Fim9JzD/0auoGtUu4mgnna
 oEEpQEOjgT7l9TVuO3Qa/SeH+E0m55y5Fjpp6ZToc481za3xAcxK/BtIX5Wn1mQ6+szfrJQ6
 59y2io437BeuWIRjQniSxHz1kgtFECiV30yHRgOoQlzUea7FgsnuWdstgfWi6LxstswEzxLZ
 Sj1EqpXYZE4uLjh6dW292sO+j4LEqPYr53hyV4I2LPmptPE9Rb9yCTAbSUlzgjiyyjuXhcwM
 qf3lzsm02y7Ooq+ERVKiJzlvLd9tSe4jRx6Z6LMXhB21fa5DGs/tHAcUF35hSJrvMJzPT/+u
 /oVmYDFZkbLlqs2XpWaVCo2jv8+iHxZZ9FL7F6AHFzqEFdqGnJQqmEApiRqH6b4jRBOgJ+cY
 qc+rJggwMQcJL9F+oDm3wX47nr6jIsEB5ZftdybIzpMZ5V9v45lUwmdnMrSzZVgC4jRGXzsU
 EViBQt2CopXtHtYfPAO5nAkIvKSNp3jmGxZw4aTc5xoAZBLo0OV+Ezo71pg3AYvq0a3/oGRG
 KQ06ztUMRrj8eVtpImjsWCd0bDWRaaR4vqhCHvAG9iWXZu4qh3ipie2Y0oSJygcZT7H3UZxq
 fyYKiqEmRuqsvv6dcbblD8ZLkz1EVZL6djImH5zc5x8qpVxlA0A0i23v5QvN00m6G9NFF0Le
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240611083236.1609-3-Yuxi.Wang@monolithicpower.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/06/2024 10:32, Yuxi Wang wrote:
> This commit adds support for MPS MP3326 LED driver.

Please do not use "This commit/patch/change", but imperative mood. See
longer explanation here:
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

> 
> Signed-off-by: Yuxi Wang <Yuxi.Wang@monolithicpower.com>
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index d721b254e1e4..3ca7be35c834 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig



> +/*
> + * PWM in the range of [0 255]
> + */
> +static int led_pwm_store(struct device *dev, struct device_attribute *attr,
> +			     const char *buf, size_t count)

Nope.

...

> +	}
> +	r_val = r_val * 255 / 4095 + (r_val * 255 % 4095) / (4095 / 2);
> +	g_val = g_val * 255 / 4095 + (g_val * 255 % 4095) / (4095 / 2);
> +	b_val = b_val * 255 / 4095 + (b_val * 255 % 4095) / (4095 / 2);
> +	if (led->num_colors == 1)
> +		return sysfs_emit(buf, "0x%x\n", r_val);
> +	else
> +		return sysfs_emit(buf, "0x%x 0x%x 0x%x\n", r_val, g_val, b_val);
> +}
> +
> +static int led_enable_store(struct device *dev,
> +				struct device_attribute *attr, const char *buf,
> +				size_t count)

Eeeee? store to enable LED? Really?

...

> +{
> +	struct led_classdev *lcdev = dev_get_drvdata(dev);
> +	struct mp3326_led *led = container_of(lcdev, struct mp3326_led, cdev);
> +	struct mp3326 *chip = led->private_data;
> +	int ret;
> +	uint val, i;


> +
> +static DEVICE_ATTR_RW(led_pwm);
> +static DEVICE_ATTR_RW(led_enable);
> +static DEVICE_ATTR_RO(led_short_fault);
> +static DEVICE_ATTR_RO(led_open_fault);

No, for multiple reasons:
1. Where ABI documentation?
2. There is a standard sysfs interface. No need for most of that. Please
explain why standard interface does not fit your needs - for each new
interface.

> +
> +static struct attribute *led_sysfs_attrs[] = {
> +	&dev_attr_led_pwm.attr,
> +	&dev_attr_led_enable.attr,
> +	&dev_attr_led_short_fault.attr,
> +	&dev_attr_led_open_fault.attr,
> +	NULL,
> +};
> +
> +ATTRIBUTE_GROUPS(led_sysfs);
> +
> +static int mp3326_add_led(struct mp3326 *chip, struct device_node *np,
> +			  int index)
> +{
> +	struct mp3326_led *led = &chip->leds[index];
> +	struct mc_subled *info;
> +	struct device_node *child;
> +	struct led_classdev *cdev;
> +	struct led_init_data init_data = {};
> +	int ret;
> +	int i = 0;
> +	int count;
> +	u32 color = 0;
> +	u32 reg = 0;
> +
> +	ret = of_property_read_u32(np, "color", &color);
> +	if (ret) {
> +		dev_err(&chip->client->dev, "Miss color in the node\n");
> +		return ret;
> +	}

Blank line

> +	led->private_data = chip;
> +	if (color == LED_COLOR_ID_RGB) {
> +		count = of_get_child_count(np);
> +		if (count != 3) {
> +			dev_err(&chip->client->dev,
> +				"RGB must have three node.\n");
> +			return -EINVAL;
> +		}
> +
> +		info = devm_kcalloc(&chip->client->dev, 3, sizeof(*info),
> +				    GFP_KERNEL);
> +		if (!info)
> +			return -ENOMEM;
> +
> +		for_each_available_child_of_node(np, child) {
> +			ret = of_property_read_u32(child, "reg", &reg);
> +			if (ret || reg > MAX_CHANNEL) {
> +				dev_err(&chip->client->dev,
> +					"reg must less or equal than %d\n",
> +					MAX_CHANNEL);
> +				return -EINVAL;
> +			}
> +
> +			ret = of_property_read_u32(child, "color", &color);
> +			if (ret) {
> +				dev_err(&chip->client->dev,
> +					"color must have value\n");
> +				return ret;
> +			}
> +
> +			if (color > 3 || !color) {
> +				dev_err(&chip->client->dev,
> +					"color must be Red, Green and Blue. The color is %d\n",
> +					color);
> +				return ret;
> +			}
> +			info[i].color_index = color;
> +			info[i].channel = reg;
> +			info[i].brightness = 0;
> +			i++;
> +		}
> +
> +		led->subled_info = info;
> +		led->num_colors = 3;
> +		cdev = &led->cdev;
> +		cdev->max_brightness = MAX_BRIGHTNESS;
> +		cdev->brightness_set_blocking = led_brightness_set;
> +		cdev->groups = led_sysfs_groups;
> +		init_data.fwnode = &np->fwnode;
> +
> +		ret = devm_led_classdev_register_ext(&chip->client->dev,
> +						     &led->cdev, &init_data);
> +
> +		if (ret) {
> +			dev_err(&chip->client->dev,
> +				"Unable register multicolor:%s\n", cdev->name);
> +			return ret;
> +		}
> +	} else {
> +		ret = of_property_read_u32(np, "reg", &reg);
> +		if (ret || reg > MAX_CHANNEL) {
> +			dev_err(&chip->client->dev,
> +				"reg must less or equal than %d\n",
> +				MAX_CHANNEL);
> +			return -EINVAL;
> +		}
> +		info = devm_kcalloc(&chip->client->dev, 1, sizeof(*info),
> +				    GFP_KERNEL);
> +		led->num_colors = 1;
> +		info[i].color_index = LED_COLOR_ID_WHITE;
> +		info[i].channel = reg;
> +		info[i].brightness = 0;
> +		led->subled_info = info;
> +		cdev = &led->cdev;
> +		cdev->max_brightness = MAX_BRIGHTNESS;
> +		cdev->brightness_set_blocking = led_brightness_set;
> +		cdev->groups = led_sysfs_groups;
> +		init_data.fwnode = &np->fwnode;
> +		ret = devm_led_classdev_register_ext(&chip->client->dev,
> +						     &led->cdev, &init_data);
> +		if (ret) {
> +			dev_err(&chip->client->dev, "Unable register led:%s\n",
> +				cdev->name);
> +			return ret;
> +		}
> +	}

Blank line

> +	return ret;
> +}
> +
> +static int mp3326_parse_dt(struct mp3326 *chip)
> +{
> +	struct device_node *np = dev_of_node(&chip->client->dev);
> +	struct device_node *child;
> +	int ret;
> +	int i = 0;
> +
> +	for_each_available_child_of_node(np, child) {
> +		ret = mp3326_add_led(chip, child, i);
> +		if (ret)
> +			return ret;
> +		i++;
> +	}
> +
> +	ret = regmap_write(chip->regmap, MP3326_PWM_CTRL_CHANNEL_9_16, 0);
> +	if (ret)
> +		return ret;

Blank line

> +	ret = regmap_write(chip->regmap, MP3326_PWM_CTRL_CHANNEL_1_8, 0);
> +	if (ret)
> +		return ret;

Blank line

> +	return 0;
> +}
> +
> +static int mp3326_leds_probe(struct i2c_client *client)
> +{
> +	struct mp3326 *chip;
> +	const struct reg_field *reg_fields;
> +	int count, i, j;
> +
> +	count = device_get_child_node_count(&client->dev);
> +	if (!count) {

Drop {

Please run scripts/checkpatch.pl and fix reported warnings. Then please
run `scripts/checkpatch.pl --strict` and (probably) fix more warnings.
Some warnings can be ignored, especially from --strict run, but the code
here looks like it needs a fix. Feel free to get in touch if the warning
is not clear.

> +		return dev_err_probe(&client->dev, -EINVAL,
> +				     "Incorrect number of leds (%d)", count);
> +	}

blank line

> +	chip = devm_kzalloc(&client->dev, struct_size(chip, leds, count),
> +			    GFP_KERNEL);
> +	if (!chip)
> +		return -ENOMEM;
> +
> +	chip->client = client;
> +	chip->num_of_leds = count;
> +	i2c_set_clientdata(client, chip);
> +	chip->regmap = devm_regmap_init_i2c(client, &MP3326_regmap_config);
> +	if (IS_ERR(chip->regmap))
> +		return PTR_ERR(chip->regmap);
> +
> +	for (i = 0; i < MAX_CHANNEL; i++) {
> +		reg_fields = channels_reg_fields[i];
> +		for (j = 0; j < MAX_CTRL; j++) {
> +			chip->regmap_fields[i][j] = devm_regmap_field_alloc(
> +				&client->dev, chip->regmap, reg_fields[j]);
> +			if (IS_ERR(chip->regmap_fields[i][j]))
> +				return PTR_ERR(chip->regmap_fields[i][j]);
> +		}
> +	}

Blank line

> +	if (mp3326_parse_dt(chip))
> +		return 1;

What is one? This looks like some sort of user-space or downstream
approach. That's not how it works for upstream kernel. Do not introduce
your downstream/user-space/other-system coding style and programming
interface.

You must use Linux approach.

There is no way probe function returns a "1". See other files as example.


> +	else
> +		return 0;
> +}
> +
> +static const struct i2c_device_id mp3326_id[] = { { "mp3326", 0 }, {} };

This must be formatted as kernel coding style. See other files as an
example.

> +MODULE_DEVICE_TABLE(i2c, mp3326_id);
> +
> +static const struct of_device_id mp3326_of_match[] = { { .compatible =
> +								 "mps,mp3326" },
> +						       {} };
> +MODULE_DEVICE_TABLE(of, mp3326_of_match);
> +
> +static struct i2c_driver mp3326_driver = {
> +	.probe = mp3326_leds_probe,
> +	.driver = {
> +			.name = "mp3326_led",
> +			.of_match_table = mp3326_of_match,
> +		   },
> +	.id_table = mp3326_id,
> +};
> +
> +module_i2c_driver(mp3326_driver);
> +MODULE_AUTHOR("Yuxi Wang <Yuxi.Wang@monolithicpower.com>");
> +MODULE_DESCRIPTION("MPS MP3326 LED driver");
> +MODULE_LICENSE("GPL");

Best regards,
Krzysztof


