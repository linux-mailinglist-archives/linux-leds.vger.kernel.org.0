Return-Path: <linux-leds+bounces-4394-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 405E4A7BCAC
	for <lists+linux-leds@lfdr.de>; Fri,  4 Apr 2025 14:30:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 237E23B3E18
	for <lists+linux-leds@lfdr.de>; Fri,  4 Apr 2025 12:30:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31C5A1D9324;
	Fri,  4 Apr 2025 12:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rFwelLUu"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0739A1D47AD;
	Fri,  4 Apr 2025 12:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743769849; cv=none; b=i1IOhx4mKOFTses2uNnHln+McsuDQwb7bsODDDYvWvDt53tapqR8XqpVIbpv/6nmlK4HtJ96cLwmMNK/WwxpH3XlJ/kQvRZabJZlNOONTk57oiPET0/ox51TBRc/QAYNVw3zb7Vh7Bf9mppkWScWNB9YLRMW7K42KUkKhGVoc+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743769849; c=relaxed/simple;
	bh=ETOr91Tq8ZKbLALXWnmPJpwuKqE608g5yS6RULec6BE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aaaLg7DmZs1ZMXF9BIPtYw25wXaKGMlvRbqJW8O2RT/hIzovP36G3ZXIeaQ3CFEvSLkZTe4PyZSi3WDRqjCYwluEsR5j5bavWb9oM0kkH3FaJQrURnOnQ0QKLAURmo5y3LGSy0QlV2TFFCV4UXNW4/gsaxzdZa0WPKFF5D8QZTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rFwelLUu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C239C4CEE8;
	Fri,  4 Apr 2025 12:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743769848;
	bh=ETOr91Tq8ZKbLALXWnmPJpwuKqE608g5yS6RULec6BE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rFwelLUu9lopSMIfKa7vjUPT1+t9fafdqTjA/5ooYI7rnDZ2uL4D5kopyVbgmmdJc
	 fTXh0rXQ66TSJslbEi0ecZCN+T/8boQNTcapie0ZL3fn7xQksk4RCBTBfvILx7zEWs
	 njOee1Jy/C0sOGr/CLtd3ru62U2V0XEKIAKNB4Cdd/PW4S+7bmDZyePr3tS59bc6r4
	 AyB8ZX/uXY/Y33whUqzsD2FR+ZR3CXXj8mGHSXRBcz+eEXvhrIQjawhw4yrcp0YJXA
	 qTrXpOUHDwe28ZySIBLraIoiMPyCqkcpUjLt4bfvKdMmDYSXcSWbaDUWty7e1bYZgC
	 oB+VFtndtPw8Q==
Date: Fri, 4 Apr 2025 13:30:45 +0100
From: Lee Jones <lee@kernel.org>
To: Craig McQueen <craig@mcqueen.au>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] leds: Add some setup ioctls to uleds driver
Message-ID: <20250404123045.GA278642@google.com>
References: <20250317022220.423966-1-craig@mcqueen.au>
 <20250317022220.423966-2-craig@mcqueen.au>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250317022220.423966-2-craig@mcqueen.au>

On Mon, 17 Mar 2025, Craig McQueen wrote:

> * Add an ioctl for setup as an alternative to doing a write.
>   This is similar to the ioctl that was added to uinput for setup.
> * Add an ioctl to set a default trigger for the LED.
> 
> Signed-off-by: Craig McQueen <craig@mcqueen.au>
> ---
>  Documentation/leds/uleds.rst |   6 ++
>  drivers/leds/uleds.c         | 125 ++++++++++++++++++++++++++++-------
>  include/uapi/linux/uleds.h   |  30 ++++++++-
>  3 files changed, 137 insertions(+), 24 deletions(-)
> 
> diff --git a/Documentation/leds/uleds.rst b/Documentation/leds/uleds.rst
> index 4077745dae00..0512e577d63a 100644
> --- a/Documentation/leds/uleds.rst
> +++ b/Documentation/leds/uleds.rst
> @@ -24,6 +24,12 @@ A new LED class device will be created with the name given. The name can be
>  any valid sysfs device node name, but consider using the LED class naming
>  convention of "devicename:color:function".
>  
> +Alternatively, setup can be done with an ioctl call, passing a pointer to
> +the structure.
> +
> +There is also an ioctl call to configure a default trigger for the LED, by
> +passing a pointer to a structure containing the name of a trigger.
> +
>  The current brightness is found by reading an int value from the character
>  device. Reading will block until the brightness changes. The device node can
>  also be polled to notify when the brightness value changes.
> diff --git a/drivers/leds/uleds.c b/drivers/leds/uleds.c
> index 374a841f18c3..598e376a4b1b 100644
> --- a/drivers/leds/uleds.c
> +++ b/drivers/leds/uleds.c
> @@ -6,6 +6,7 @@
>   *
>   * Based on uinput.c: Aristeu Sergio Rozanski Filho <aris@cathedrallabs.org>
>   */
> +#include <linux/ctype.h>
>  #include <linux/fs.h>
>  #include <linux/init.h>
>  #include <linux/leds.h>
> @@ -25,13 +26,14 @@ enum uleds_state {
>  };
>  
>  struct uleds_device {
> -	struct uleds_user_dev	user_dev;
> -	struct led_classdev	led_cdev;
> -	struct mutex		mutex;
> -	enum uleds_state	state;
> -	wait_queue_head_t	waitq;
> -	int			brightness;
> -	bool			new_data;
> +	struct uleds_user_dev		user_dev;
> +	struct uleds_user_trigger	default_trigger;
> +	struct led_classdev		led_cdev;
> +	struct mutex			mutex;
> +	enum uleds_state		state;
> +	wait_queue_head_t		waitq;
> +	int				brightness;
> +	bool				new_data;
>  };
>  
>  static struct miscdevice uleds_misc;
> @@ -70,15 +72,17 @@ static int uleds_open(struct inode *inode, struct file *file)
>  	return 0;
>  }
>  
> -static ssize_t uleds_write(struct file *file, const char __user *buffer,
> -			   size_t count, loff_t *ppos)
> +static bool is_led_name_valid(const char *name)
>  {
> -	struct uleds_device *udev = file->private_data;
> -	const char *name;
> -	int ret;
> +	return ((name[0] != '\0') &&
> +		(strcmp(name, ".") != 0) &&
> +		(strcmp(name, "..") != 0) &&
> +		(strchr(name, '/') == NULL));
> +}
>  
> -	if (count == 0)
> -		return 0;
> +static int dev_setup(struct uleds_device *udev, const char __user *buffer)

uleds_dev_setup()

> +{
> +	int ret;
>  
>  	ret = mutex_lock_interruptible(&udev->mutex);
>  	if (ret)
> @@ -89,20 +93,13 @@ static ssize_t uleds_write(struct file *file, const char __user *buffer,
>  		goto out;
>  	}
>  
> -	if (count != sizeof(struct uleds_user_dev)) {
> -		ret = -EINVAL;
> -		goto out;
> -	}

Why is this no longer required?

> -
>  	if (copy_from_user(&udev->user_dev, buffer,
>  			   sizeof(struct uleds_user_dev))) {
>  		ret = -EFAULT;
>  		goto out;
>  	}
>  
> -	name = udev->user_dev.name;
> -	if (!name[0] || !strcmp(name, ".") || !strcmp(name, "..") ||
> -	    strchr(name, '/')) {
> +	if (!is_led_name_valid(udev->user_dev.name)) {

Maybe we should make this official and put it in a header somewhere?

>  		ret = -EINVAL;
>  		goto out;
>  	}
> @@ -120,7 +117,6 @@ static ssize_t uleds_write(struct file *file, const char __user *buffer,
>  
>  	udev->new_data = true;
>  	udev->state = ULEDS_STATE_REGISTERED;
> -	ret = count;
>  
>  out:
>  	mutex_unlock(&udev->mutex);
> @@ -128,6 +124,23 @@ static ssize_t uleds_write(struct file *file, const char __user *buffer,
>  	return ret;
>  }
>  
> +static ssize_t uleds_write(struct file *file, const char __user *buffer,
> +	size_t count, loff_t *ppos)
> +{
> +	struct uleds_device *udev = file->private_data;
> +	int ret;
> +
> +	if (count == 0)
> +		return 0;
> +	if (count != sizeof(struct uleds_user_dev))
> +		return -EINVAL;
> +
> +	ret = dev_setup(udev, buffer);
> +	if (ret < 0)
> +		return ret;

Nit: '\n'

> +	return count;
> +}
> +
>  static ssize_t uleds_read(struct file *file, char __user *buffer, size_t count,
>  			  loff_t *ppos)
>  {
> @@ -179,6 +192,71 @@ static __poll_t uleds_poll(struct file *file, poll_table *wait)
>  	return 0;
>  }
>  
> +/*
> + * Trigger name validation: Allow only alphanumeric, hyphen or underscore.
> + */

This is clearly a single line comment.

The first part is also invalidated by the function's nomenclature.

> +static bool is_trigger_name_valid(const char *name)
> +{
> +	size_t i;
> +
> +	if (name[0] == '\0')
> +		return false;
> +
> +	for (i = 0; i < TRIG_NAME_MAX; i++) {

Shouldn't this be <=?

> +		if (name[i] == '\0')
> +			break;
> +		if (!isalnum(name[i]) && name[i] != '-' && name[i] != '_')
> +			return false;
> +	}

Nit: '\n'

> +	/* Length check and avoid any special names. */
> +	return ((i < TRIG_NAME_MAX) &&

What if the name is exactly the max?

> +		(strcmp(name, "default") != 0));

This can go on the line above.

How about?

   return !((i < TRIG_NAME_MAX) && (strcmp(name, "default"))

> +}
> +
> +static long uleds_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> +{
> +	struct uleds_device *udev = file->private_data;
> +	struct uleds_user_trigger default_trigger;
> +	int retval = 0;
> +
> +	switch (cmd) {
> +	case ULEDS_IOC_DEV_SETUP:
> +		retval = dev_setup(udev, (const char __user *)arg);
> +		break;
> +
> +	case ULEDS_IOC_SET_DEFAULT_TRIGGER:
> +		retval = copy_from_user(&default_trigger,
> +			(struct uleds_user_trigger __user *)arg,
> +			sizeof(default_trigger));

Subsequent lines need tabbing out to the open parenthesis.

> +		if (retval)
> +			return retval;

Please open things out.

Squished code is hard to read code.

> +		retval = mutex_lock_interruptible(&udev->mutex);
> +		if (retval)
> +			return retval;
> +		if (default_trigger.name[0] == '\0') {
> +			udev->led_cdev.default_trigger = NULL;
> +		} else {
> +			if (!is_trigger_name_valid(default_trigger.name)) {
> +				mutex_unlock(&udev->mutex);
> +				return -EINVAL;
> +			}
> +			memcpy(&udev->default_trigger, &default_trigger,
> +				sizeof(udev->default_trigger));
> +			udev->led_cdev.default_trigger = udev->default_trigger.name;
> +		}
> +		if (udev->state == ULEDS_STATE_REGISTERED)
> +			led_trigger_set_default(&udev->led_cdev);
> +		mutex_unlock(&udev->mutex);
> +		break;
> +
> +	default:
> +		retval = -ENOIOCTLCMD;
> +		break;
> +	}
> +
> +	return retval;
> +}
> +
>  static int uleds_release(struct inode *inode, struct file *file)
>  {
>  	struct uleds_device *udev = file->private_data;
> @@ -200,6 +278,7 @@ static const struct file_operations uleds_fops = {
>  	.read		= uleds_read,
>  	.write		= uleds_write,
>  	.poll		= uleds_poll,
> +	.unlocked_ioctl	= uleds_ioctl,
>  };
>  
>  static struct miscdevice uleds_misc = {
> diff --git a/include/uapi/linux/uleds.h b/include/uapi/linux/uleds.h
> index 4d32a39965f8..0e9861a8c31f 100644
> --- a/include/uapi/linux/uleds.h
> +++ b/include/uapi/linux/uleds.h
> @@ -15,11 +15,39 @@
>  #ifndef _UAPI__ULEDS_H_
>  #define _UAPI__ULEDS_H_
>  
> -#define LED_MAX_NAME_SIZE	64
> +#define LED_MAX_NAME_SIZE		64
> +#define ULEDS_TRIGGER_MAX_NAME_SIZE	64
>  
>  struct uleds_user_dev {
>  	char name[LED_MAX_NAME_SIZE];
>  	int max_brightness;
>  };
>  
> +struct uleds_user_trigger {
> +	char name[ULEDS_TRIGGER_MAX_NAME_SIZE];
> +};
> +
> +

Remove this double line spacing.

> +/* ioctl commands */
> +
> +#define ULEDS_IOC_MAGIC		'l'
> +
> +/*
> + * Initial setup.
> + * E.g.:
> + *	int retval;
> + *	struct uleds_user_dev dev_setup = { "mainboard:green:battery", 255 };
> + *	retval = ioctl(fd, ULEDS_IOC_DEV_SETUP, &dev_setup);
> + */
> +#define ULEDS_IOC_DEV_SETUP		_IOW(ULEDS_IOC_MAGIC, 0x01, struct uleds_user_dev)
> +
> +/*
> + * Set the default trigger.
> + * E.g.:
> + *	int retval;
> + *	struct uleds_user_trigger default_trigger = { "battery" };
> + *	retval = ioctl(fd, ULEDS_IOC_SET_DEFAULT_TRIGGER, &default_trigger);
> + */
> +#define ULEDS_IOC_SET_DEFAULT_TRIGGER	_IOW(ULEDS_IOC_MAGIC, 0x02, struct uleds_user_trigger)
> +
>  #endif /* _UAPI__ULEDS_H_ */
> -- 
> 2.48.1
> 
> 

-- 
Lee Jones [李琼斯]

