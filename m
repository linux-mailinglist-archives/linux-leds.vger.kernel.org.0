Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D49F41B91AC
	for <lists+linux-leds@lfdr.de>; Sun, 26 Apr 2020 18:24:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726230AbgDZQYW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 26 Apr 2020 12:24:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726146AbgDZQYV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Sun, 26 Apr 2020 12:24:21 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18B29C061A0F;
        Sun, 26 Apr 2020 09:24:21 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id y24so17605685wma.4;
        Sun, 26 Apr 2020 09:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2FSIBGKb8N23CdS4eZEpPYbf1u7aJ6F81ThCyPR7vaM=;
        b=bG8hqFeMjAs1s7psjEGM8VNstrlaioDV7KG0xPCw/DI7PZVuZPUNxhf92qckFSorPD
         hSk42AoIjy+G9trimASfQAdNq6SAfJENYu1uyf6xZYuaYuqkBD0r5kOy66gdEyI6Z10M
         83PAJq4YxvQTigibxBLbTdMkBDtnoeK2RsSzVls/pe9qbSoRd7gg55pmCpPWivCzlLbA
         jGfBFURtU9jGa0T7Ix6gC2z/pqBhdRPeye1fJoOBsjUHQUxvjQFhwtLECQf60tPbNPX0
         7UlsJWOAYqBljPhmRYuqKF1CZmO8/7qlAaDJg48ptdGoJSAfOQyTQxsslH8o5rVp1uQf
         e84A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2FSIBGKb8N23CdS4eZEpPYbf1u7aJ6F81ThCyPR7vaM=;
        b=fohdVTbCBC1GWhv16QrOZasz8Hyvg2BLwynCccqcA8ZoI+XNkDHcjMk6YdspW9Kr3o
         9Pn2boSiXpp9ByBuQt2hNsC0NW4TcPdZwE1omKyDd18tRkrQgSxrYDKYOJec6xbRHFjV
         yyIdQrXf/IJjo6bbQNFUsQgxWYsJ6J/n2wG3hD4eFVjD/o/e/pgYc2vQRiJh4LNxkIK0
         I1sjDU74YNnlY0xGvrhkFA3jGKWuxrc0DKaJfk+Z8vwXtuC7EpIN8c2T8dS4pF3A+8d4
         Dw6ZBSxxYMK0ObySGUiwfttasiMqTioKDRyOjza1NcLNTlxQ79ihAQuwFmJGLP9OKdNg
         Oajw==
X-Gm-Message-State: AGi0Pubb9Th3ES/UbGrCvzvAWj++nXWZVTAWJmkALrI68Sguk9Pro459
        2fq31mZQegHcamVqUGzvZipd4+SA
X-Google-Smtp-Source: APiQypI6O0pVSBPH3EAc6Gt9qNDpExt9txPY19Yu3FivCObpz9U34rAfzu0Mm6JHBF1p+9QkzgHDiw==
X-Received: by 2002:a1c:c2d6:: with SMTP id s205mr22676525wmf.90.1587918259609;
        Sun, 26 Apr 2020 09:24:19 -0700 (PDT)
Received: from [192.168.1.23] (afcl109.neoplus.adsl.tpnet.pl. [95.49.63.109])
        by smtp.gmail.com with ESMTPSA id e21sm18182225wrc.1.2020.04.26.09.24.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Apr 2020 09:24:19 -0700 (PDT)
Subject: Re: [PATCH v20 03/17] leds: multicolor: Introduce a multicolor class
 definition
To:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200423155524.13971-1-dmurphy@ti.com>
 <20200423155524.13971-4-dmurphy@ti.com> <20200425202306.GA23926@amd>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <a19ff014-32f1-eb18-ceb6-581503821fcc@gmail.com>
Date:   Sun, 26 Apr 2020 18:24:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200425202306.GA23926@amd>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi all,

On 4/25/20 10:23 PM, Pavel Machek wrote:
> Hi!
> 
[...]
>> +	for (i = 0; i < mcled_cdev->num_colors; i++)
>> +		mcled_cdev->multicolor_info[i].color_brightness = brightness *
>> +					  mcled_cdev->multicolor_info[i].color_led_intensity /
>> +					  led_cdev->max_brightness;
> 
> It would be good to get this under ~80 characters. Perhaps shorter
> identifiers would help... shortening multicolor_ to mc_?


And color_led_intensity to led_intensity.

> 
>> +static ssize_t multi_led_intensity_store(struct device *dev,
>> +				struct device_attribute *intensity_attr,
>> +				const char *buf, size_t size)
>> +{
>> +	struct led_classdev *led_cdev = dev_get_drvdata(dev);
>> +	struct led_classdev_mc *mcled_cdev = lcdev_to_mccdev(led_cdev);
>> +	int nrchars, offset = 0;
>> +	int intensity_value[LED_COLOR_ID_MAX];
>> +	int i;
>> +	ssize_t ret;
>> +
>> +	mutex_lock(&led_cdev->led_access);
>> +
>> +	for (i = 0; i < mcled_cdev->num_colors; i++) {
>> +		ret = sscanf(buf + offset, "%i%n",
>> +			     &intensity_value[i], &nrchars);
>> +		if (ret != 1) {
>> +			dev_err(led_cdev->dev,
> 
> dev_dbg, at most. It is user-triggerable.
> 
>> +				"Incorrect number of LEDs expected %i values intensity was not applied\n",
>> +				mcled_cdev->num_colors);
>> +			goto err_out;
> 
> Should not we return -ERRNO to userspace on error?
> 
>> +		}
>> +		offset += nrchars;
>> +	}
> 
> This checks for "not enough" intensities. Do we need check for "too
> many" intensities?
> 
>> +static ssize_t multi_led_intensity_show(struct device *dev,
>> +			      struct device_attribute *intensity_attr,
>> +			      char *buf)
>> +{
>> +	struct led_classdev *led_cdev = dev_get_drvdata(dev);
>> +	struct led_classdev_mc *mcled_cdev = lcdev_to_mccdev(led_cdev);
>> +	int len = 0;
>> +	int i;
>> +
>> +	for (i = 0; i < mcled_cdev->num_colors; i++)
>> +		len += sprintf(buf + len, "%d ",
>> +			    mcled_cdev->multicolor_info[i].color_led_intensity);
>> +
>> +	len += sprintf(buf + len, "%s", "\n");
> 
> This will result in extra " " before end of line.
> 
> Please don't use "%s", "\n" to add single character. "\n" would be enough.
> 
> 
>> +	struct led_classdev *led_cdev = dev_get_drvdata(dev);
>> +	struct led_classdev_mc *mcled_cdev = lcdev_to_mccdev(led_cdev);
>> +	int len = 0;
>> +	int index;
>> +	int i;
>> +
>> +	for (i = 0; i < mcled_cdev->num_colors; i++) {
>> +		index = mcled_cdev->multicolor_info[i].color_index;
>> +		len += sprintf(buf + len, "%s ", led_colors[index]);
>> +	}
>> +
>> +	len += sprintf(buf + len, "%s", "\n");
> 
> Same here.
> 
>> +int led_classdev_multicolor_register_ext(struct device *parent,
>> +				     struct led_classdev_mc *mcled_cdev,
>> +				     struct led_init_data *init_data)
>> +{
>> +	struct led_classdev *led_cdev;
>> +
>> +	if (!mcled_cdev)
>> +		return -EINVAL;
>> +
>> +	if (!mcled_cdev->num_colors)
>> +		return -EINVAL;
> 
> if (num_colors > max)... ?
> 
>> +#ifndef __LINUX_MULTICOLOR_LEDS_H_INCLUDED
>> +#define __LINUX_MULTICOLOR_LEDS_H_INCLUDED
> 
> Usual style is "_LINUX_MULTICOLOR_LEDS_H".
> 
>> +#else
>> +
>> +static inline  int led_classdev_multicolor_register_ext(struct device *parent,
> 
> double space after "inline".
> 
>> +					    struct led_classdev_mc *mcled_cdev,
>> +					    struct led_init_data *init_data)
>> +{
>> +	return -EINVAL;
>> +}
> 
> Do we need to include these stubs? I guess it is okay to have them,
> OTOH I'd expect drivers to depend on MULTICOLOR being available...

Single driver can support both monochrome and multicolor LED class,
which is chosen basing on DT. In this regard having no-ops for LED mc
class is justified since it is a superset of monochrome LED class.

-- 
Best regards,
Jacek Anaszewski
