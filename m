Return-Path: <linux-leds+bounces-1426-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7766989C8BC
	for <lists+linux-leds@lfdr.de>; Mon,  8 Apr 2024 17:50:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E328F1F21DAA
	for <lists+linux-leds@lfdr.de>; Mon,  8 Apr 2024 15:50:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C81261420D2;
	Mon,  8 Apr 2024 15:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E41vUTbN"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049FE1420C8
	for <linux-leds@vger.kernel.org>; Mon,  8 Apr 2024 15:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712591402; cv=none; b=paJ/PIWE9eeQc9n+fuG70xl0WkiQR4yY52f8YqUbzVE97+8Ww4xqJew6RQ2D5nQIf+Md2GNmxXghcV1GPJufOxoaWZm86yKNTv8fIeo0zGnBVk9i+EjCOb99acLvtOrDgoeOBieerQhNkjdE3DTC4kumrKm/Vfegwh/abL+1rjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712591402; c=relaxed/simple;
	bh=ty/CVd4TTkw7zJcxiPWThfim4GmGkodvBh97gUHo4qk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YrbhXmy23YdERXiNRX3gJzU/F6suwa/sMgzqHeKxMQ/W+i1HZXwdIxutFEBSpK1UbG3mBYMVvMUswsJQa/Zr6xlc+em1kG+jzmY74xuRdPq1O5Eq8CejW8ou6bs8/9NYInIRTK3+VjQzOuxskNh01XSFIgxNXn6QwaVIsrc9INg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E41vUTbN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712591399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VCSzxzdVxSU29njl+SVIs1GGY32kHpcJTqbBqSeU5KI=;
	b=E41vUTbNq8bGk583lgL9tqvzC1mRdbPeQHQdX5knhojBnj88dnqHCzogack9hnBwZS8It5
	Xk+5wNRqPx30p3rCJLAkD3n8yAwu/rLN2EzlXLgNWW+EtUk9dMDJ4HtyYJrmaUhrGIJnWr
	WxaVu248DWxmIVJSOdQsXqq7sYWbsFo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-180-32AVyR7fP9mB9rzuYzjLhA-1; Mon, 08 Apr 2024 11:49:58 -0400
X-MC-Unique: 32AVyR7fP9mB9rzuYzjLhA-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5684c1abc7fso1893098a12.3
        for <linux-leds@vger.kernel.org>; Mon, 08 Apr 2024 08:49:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712591397; x=1713196197;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VCSzxzdVxSU29njl+SVIs1GGY32kHpcJTqbBqSeU5KI=;
        b=RR/jPtImdERdGP+YnYDEKTUTR4Xc5Vz4WE3r2QnEWW0AqTFmAy9CqTvw7uFlwrAvA0
         E2TUyLWbe0F7yFQr1aBWXPyxx5urERyk0wgiaikIFmA7vS3u6JDfMRVoD0EyucPVrr7D
         yoCFYEEwTXxkN98/xSFNXaW/MzDqhKH5pzXlFexdfzuFaXr6GoTGroCATz5ECuw3qmOe
         DuGQ/z5m/7BIBVASg8MebSjXkdz9m7RPMvP3LAR0mDa+97GUJ3DegNYGW3m39Jd0D2Mb
         PlM9nky0XcZwVeD9j3vJkURyVhPG0a2cGf4uhu7go0tNeD782Qv+YLkUDhbTibDxzzmg
         x3sA==
X-Forwarded-Encrypted: i=1; AJvYcCUlg6vEfM/vNx1gh+9oAlddBa9KSN51mi0Eldbs4T4G5ZQeWlf5//jcr3U7HBy/me0Tv6B+Ep75AyRlcTYV455HQSGkDFHYV5t9bQ==
X-Gm-Message-State: AOJu0YwerCbyxnIZ32yAB7BgiTSFcu7xD+/YzfvYM/JdQY5OH5tI7T/g
	tZSW7V18jCAZ35KhVWjHUa9dgjdAxm/G+z5SV+wxK14cLpmsXQ3vCBf4cSiz34/gGyiSbOn2Yn3
	8F7n1oiOoPqVZ/G0UQQ7os4yeMdqzia+nE1XyX9W+x/5Ag4NvMZOkkXZ0ZQs=
X-Received: by 2002:a50:c30c:0:b0:56d:c295:dde3 with SMTP id a12-20020a50c30c000000b0056dc295dde3mr7866836edb.35.1712591397437;
        Mon, 08 Apr 2024 08:49:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpteSqH7bmbEhgkTidBlhAPpdsINF1J8RY2W+YoNQKBvbxOaGD3t8TIPxLJhKwHDyPy4PMqg==
X-Received: by 2002:a50:c30c:0:b0:56d:c295:dde3 with SMTP id a12-20020a50c30c000000b0056dc295dde3mr7866811edb.35.1712591397056;
        Mon, 08 Apr 2024 08:49:57 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ig4-20020a056402458400b0056e51535a2esm2362376edb.82.2024.04.08.08.49.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 08:49:56 -0700 (PDT)
Message-ID: <db463ff3-a6e1-4cb7-b662-5291ed75deaf@redhat.com>
Date: Mon, 8 Apr 2024 17:49:56 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] platform/x86: ideapad-laptop: add fn_lock_get/set
 functions
To: Gergo Koteles <soyer@irl.hu>, Ike Panhc <ike.pan@canonical.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org
References: <cover.1712063200.git.soyer@irl.hu>
 <dfd3a62a2b71339bbddf01e8a2ccd5ca92ce7202.1712063200.git.soyer@irl.hu>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <dfd3a62a2b71339bbddf01e8a2ccd5ca92ce7202.1712063200.git.soyer@irl.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

<sorry about the previous empty email, I hit send too soon>

Hi,

On 4/2/24 3:21 PM, Gergo Koteles wrote:
> The FnLock is retrieved and set in several places in the code.
> 
> Move details into ideapad_fn_lock_get and ideapad_fn_lock_set functions.
> 
> Signed-off-by: Gergo Koteles <soyer@irl.hu>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/platform/x86/ideapad-laptop.c | 38 +++++++++++++++++++--------
>  1 file changed, 27 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index 901849810ce2..529df08af548 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -513,11 +513,8 @@ static ssize_t fan_mode_store(struct device *dev,
>  
>  static DEVICE_ATTR_RW(fan_mode);
>  
> -static ssize_t fn_lock_show(struct device *dev,
> -			    struct device_attribute *attr,
> -			    char *buf)
> +static int ideapad_fn_lock_get(struct ideapad_private *priv)
>  {
> -	struct ideapad_private *priv = dev_get_drvdata(dev);
>  	unsigned long hals;
>  	int err;
>  
> @@ -525,7 +522,27 @@ static ssize_t fn_lock_show(struct device *dev,
>  	if (err)
>  		return err;
>  
> -	return sysfs_emit(buf, "%d\n", !!test_bit(HALS_FNLOCK_STATE_BIT, &hals));
> +	return !!test_bit(HALS_FNLOCK_STATE_BIT, &hals);
> +}
> +
> +static int ideapad_fn_lock_set(struct ideapad_private *priv, bool state)
> +{
> +	return exec_sals(priv->adev->handle,
> +		state ? SALS_FNLOCK_ON : SALS_FNLOCK_OFF);
> +}
> +
> +static ssize_t fn_lock_show(struct device *dev,
> +			    struct device_attribute *attr,
> +			    char *buf)
> +{
> +	struct ideapad_private *priv = dev_get_drvdata(dev);
> +	int brightness;
> +
> +	brightness = ideapad_fn_lock_get(priv);
> +	if (brightness < 0)
> +		return brightness;
> +
> +	return sysfs_emit(buf, "%d\n", brightness);
>  }
>  
>  static ssize_t fn_lock_store(struct device *dev,
> @@ -540,7 +557,7 @@ static ssize_t fn_lock_store(struct device *dev,
>  	if (err)
>  		return err;
>  
> -	err = exec_sals(priv->adev->handle, state ? SALS_FNLOCK_ON : SALS_FNLOCK_OFF);
> +	err = ideapad_fn_lock_set(priv, state);
>  	if (err)
>  		return err;
>  
> @@ -1709,7 +1726,6 @@ static void ideapad_wmi_notify(struct wmi_device *wdev, union acpi_object *data)
>  {
>  	struct ideapad_wmi_private *wpriv = dev_get_drvdata(&wdev->dev);
>  	struct ideapad_private *priv;
> -	unsigned long result;
>  
>  	mutex_lock(&ideapad_shared_mutex);
>  
> @@ -1722,11 +1738,11 @@ static void ideapad_wmi_notify(struct wmi_device *wdev, union acpi_object *data)
>  		ideapad_input_report(priv, 128);
>  		break;
>  	case IDEAPAD_WMI_EVENT_FN_KEYS:
> -		if (priv->features.set_fn_lock_led &&
> -		    !eval_hals(priv->adev->handle, &result)) {
> -			bool state = test_bit(HALS_FNLOCK_STATE_BIT, &result);
> +		if (priv->features.set_fn_lock_led) {
> +			int brightness = ideapad_fn_lock_get(priv);
>  
> -			exec_sals(priv->adev->handle, state ? SALS_FNLOCK_ON : SALS_FNLOCK_OFF);
> +			if (brightness >= 0)
> +				ideapad_fn_lock_set(priv, brightness);
>  		}
>  
>  		if (data->type != ACPI_TYPE_INTEGER) {


