Return-Path: <linux-leds+bounces-2793-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 359BD97E190
	for <lists+linux-leds@lfdr.de>; Sun, 22 Sep 2024 14:39:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CC241B20DEC
	for <lists+linux-leds@lfdr.de>; Sun, 22 Sep 2024 12:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 169DD632;
	Sun, 22 Sep 2024 12:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZwBgUpDa"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60710623
	for <linux-leds@vger.kernel.org>; Sun, 22 Sep 2024 12:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727008768; cv=none; b=gIvQff2FdK6aZkonOXLDEZcZTpzpOXO+3mFdlMEe4GtpjkLDva/8QDzZou6VA2fHOPLH2KKHXB/FiqO7L/XT+1eBaKgn3J3bCgy3bcNTYbavBtiIK8cSG9TZay0AClytFDwSXMvq6I+1zVmoX6BWuD1RweJcf84v3GyULih4Km0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727008768; c=relaxed/simple;
	bh=uwjkSbNQAMwL1nfDWn8LI2eDU1yGIom3W7RkWil6VvQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ao0UWWxuq+YoxLx8/8kfLXbOuuoh4j2VpJuwSzrShEsXLnUFAGtMyAAzYTxYl1IvbJNGTnFndE7MWtb8m6Sc1Omkw1m4Dk6VBGk/l9mf0vJsvhc443BfOzHCcoTCe/+8qlOJmftiGXweLzs+/tgnnY8kN8+kvXIIOgBpYghk71s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZwBgUpDa; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a8d2b24b7a8so822606166b.1
        for <linux-leds@vger.kernel.org>; Sun, 22 Sep 2024 05:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727008765; x=1727613565; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pJlOmvrQkb4r+SVZSfwOxfwpfeA5yY8RR6/OcjAtq4M=;
        b=ZwBgUpDaVXlcivinIFTLe7Pok5TickxSpLNrP0nSFrhm0Esdax04e5Z+yjlbisgFfM
         otNRAm31ol6PL0byBPEw5r8Nv1tRm0Vlr5M3zHfO52tiCsU48HS2tp7V9SScJVpkjOCP
         fGSXj6/DXkNRNZPRZR80n1A/PsZMbyU3/cCEm1UlI5x67VkeifTQT1p3Ph1dxCgZdxBZ
         1AWj8jBQk9+d8v8AT3btaLUMQjK5tR3yeNi6s4dnaZiYb4TBS6r/FuE6/ljLHFhbvSww
         +/FqwH8oTT+FQd/LmnBQbto9wGjmZq5/WtVuBLxhIzkDa4Nco8NlvWMw+ET1h+k0VT3H
         u/oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727008765; x=1727613565;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pJlOmvrQkb4r+SVZSfwOxfwpfeA5yY8RR6/OcjAtq4M=;
        b=ZnVK1ChS3PBtnds6EBjdBd8WW1BT8+oTHHvEP8WuC/NBfvWBU+FUv0XsS1HMnvSeL+
         IwcA8zVbRHvBBy2dsvjJEIam1t0eIaw7rz0JHUvKogx3/bbKlg2F+uZnJv793EMucpCg
         yK47KntV3GUVimCcliuoVWk7CkUcRyHFUKnf13Joy558Kqow4qZfmqXDiVqnOkZ98FJK
         4vvud6QY3aHAx+XCyWQzBB/ynm5Wt+kOzwPdqHsr7ASEI+b4W2/WSrQNhktNupsjkPiF
         D0vcobzX5k8zicoCT+8ciUEPTGCuGhKJuiC2mfSjYVpKFWFTLpzFs16v11mE3KG0aw3l
         fIXQ==
X-Gm-Message-State: AOJu0YwkGJKuJfyu8TWUso0E8QnzUvmvcpEWwOgGmx6eMVz/EISFnUi1
	V++dgn6tg58Iu3dm1WP8lbPM3Ln41QeteaWrb3ZCiJ20cH+xG/S7
X-Google-Smtp-Source: AGHT+IHmJVL5RXLTwd0a6jxPaj9VdmNehV5npuEiXaatn1dFlFNbhH+KTPwXs/zKMZ5n5B1Y+6CjOg==
X-Received: by 2002:a17:907:3f20:b0:a90:1f60:7b2d with SMTP id a640c23a62f3a-a90d3164632mr851479366b.0.1727008764424;
        Sun, 22 Sep 2024 05:39:24 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90612e67f3sm1075764366b.185.2024.09.22.05.39.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Sep 2024 05:39:23 -0700 (PDT)
Message-ID: <e6b2eaae-580a-ea68-c0ba-ef55b2b699ff@gmail.com>
Date: Sun, 22 Sep 2024 14:39:22 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: leds-is31fl319x
To: "Weber, Thomas" <Thomas.Weber@corscience.com>,
 "hns@goldelico.com" <hns@goldelico.com>,
 "andrey_utkin@fastmail.com" <andrey_utkin@fastmail.com>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
References: <BE1P281MB266384F3566241E8B6B5D048FA6C2@BE1P281MB2663.DEUP281.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <BE1P281MB266384F3566241E8B6B5D048FA6C2@BE1P281MB2663.DEUP281.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Thomas,

On 9/20/24 16:48, Weber, Thomas wrote:
> Hello,
> you are listed as module authors for the leds-is31fl319x driver.
> 
> Should the color property and the pattern property be functional in this module?
> 
> I added this to my device tree
> 
> is31fl@64 {
>      compatible = "issi,is31fl3199";
>      reg = <0x64>;
>      #address-cells = <1>;
>      #size-cells = <0>;
>      pinctrl-names = "default";
>      pinctrl-0 = <&pinctrl_is31_sdb>;
>      shutdown-gpios = <&gpio5 6 GPIO_ACTIVE_HIGH>;
> 
>      led@1 {
>        reg = <1>;
>        label = "IND_LED_WH_1";
>        color = <LED_COLOR_ID_WHITE>;
>        linux,default-trigger = "pattern";
>        led-pattern = <0 1000 255 2000>;
>      };
> 
>      led@2 {
>        reg = <2>;
>        label = "IND_LED_BU_1";
>        color = <LED_COLOR_ID_BLUE>;
>      };
> 
> But in the rootfs I get this:
> 
> root@vsm:/sys/class/leds/IND_LED_BU_1 cat color
> white

Are you working with mainline kernel? LED class does not create 'color'
sysfs file AFAICS, but uses that DT property to construct LED class
device name (and in LED class multicolor).

And anyway, this driver does not use
devm_led_classdev_register_ext(), which is required to parse color
property, so the LED class device name is created using what
is provided in 'label' DT property.

> root@vsm:/sys/class/leds/IND_LED_WH_1 cat trigger
> [none] timer heartbeat cpu cpu0 cpu1 cpu2 cpu3 default-on panic mmc2 sbs-2-000b-charging-or-full sbs-2-000b-charging sbs-2-000b-full sbs-2-000b-charging-blink-full-solid rfkill-any rfkill-none bluetooth-power
> 
> 
> What am I doing wrong?

You seem to have LEDS_TRIGGER_PATTERN turned off in kernel config.

> Best regards
> Thomas
> 

-- 
Best regards,
Jacek Anaszewski

