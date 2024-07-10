Return-Path: <linux-leds+bounces-2231-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E7792CBAA
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jul 2024 09:10:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6AA361C20D6B
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jul 2024 07:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EAAD80BF8;
	Wed, 10 Jul 2024 07:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fVSYXOzv"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8B67F487;
	Wed, 10 Jul 2024 07:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720595455; cv=none; b=Mhmtk2hRGjumatQCpHUO1qhEdd9LtLPdyWOkketeW1TBM9goB65r7CQZqYEt2nWZ9GYBOuViHRyhti8nX0XHZF8C/v3v3XRyVTsjaFqEZBWN5jOEfVIBOX6uT/5IkQR76p8sIW/InYHn2BXoKFgvK2xrA6oOpX9roSAJJIrHcaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720595455; c=relaxed/simple;
	bh=TM4GUx5ypLAz6xUnHUt0juxxshhp24U0HVpDjloBoNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XKZ8kRkna6rK4PHWjxI+dUfbjcdhoLCxU3QMVM4XfJuFbdi6pjVqL64Nn4gifyZrhKP80m10HlDIVOmfQw3FLtINhCA2GddRtuXPmGIm43/rLUCz4YV3ZPGpeZxh80juzVvZ2e7XAx1L3rmj+NBQlHfgh2SbdDjn6/fLj5+eJgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fVSYXOzv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFEC3C4AF0A;
	Wed, 10 Jul 2024 07:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720595455;
	bh=TM4GUx5ypLAz6xUnHUt0juxxshhp24U0HVpDjloBoNM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fVSYXOzv1kbvtRAVsjUxjkpcqA3fVbwP70gLGbtsUbfzaJn+JPKm61S1SK5XG5pmy
	 S8MLvbiSSMyj6gzm6s/6Z7czuI67pPixex3We5NHDPaD09Jcwy2lDsvxf9nrVJooP8
	 CE0ApQHX1zh9wtbDazmYElflO5pOfHwtJiUy79yK0tglJdJjLH7aqUWwQCjoAyS7zI
	 jtdSDZkV+A24memzxAViMBpr5nQYvJ7KTyPAUwgx+v8+tBlsNw0ae/jKSTu5lj7ABV
	 +DA9sImslylwJKwBkZE/f/FqqnS5k9ZvGOKgPADgbaAKgIQRja7OXCjaqgEOYkMZqy
	 etnKaAtreL8rw==
Date: Wed, 10 Jul 2024 08:10:50 +0100
From: Lee Jones <lee@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH 3/3] leds: leds-lp55xx: Convert mutex lock/unlock to
 guard API
Message-ID: <20240710071050.GF501857@google.com>
References: <20240626221520.2846-1-ansuelsmth@gmail.com>
 <20240626221520.2846-3-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240626221520.2846-3-ansuelsmth@gmail.com>

On Thu, 27 Jun 2024, Christian Marangi wrote:

> Convert any entry of mutex lock/unlock to guard API and simplify code.
> With the use of guard API, handling for selttest functions can be
> greatly simplified.
> 
> Suggested-by: Markus Elfring <Markus.Elfring@web.de>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/leds/leds-lp5521.c        |  5 +-
>  drivers/leds/leds-lp5523.c        | 25 +++-----
>  drivers/leds/leds-lp5562.c        | 13 +++--
>  drivers/leds/leds-lp5569.c        | 18 ++----
>  drivers/leds/leds-lp55xx-common.c | 94 +++++++++++++------------------
>  5 files changed, 64 insertions(+), 91 deletions(-)

How was this one tested?

Can you try build-testing it again please?

> diff --git a/drivers/leds/leds-lp5521.c b/drivers/leds/leds-lp5521.c
> index de0f8ea48eba..56d16ea18617 100644
> --- a/drivers/leds/leds-lp5521.c
> +++ b/drivers/leds/leds-lp5521.c
> @@ -9,6 +9,7 @@
>   *          Milo(Woogyom) Kim <milo.kim@ti.com>
>   */
>  
> +#include <linux/cleanup.h>
>  #include <linux/delay.h>
>  #include <linux/firmware.h>
>  #include <linux/i2c.h>
> @@ -185,9 +186,9 @@ static ssize_t lp5521_selftest(struct device *dev,
>  	struct lp55xx_chip *chip = led->chip;
>  	int ret;
>  
> -	mutex_lock(&chip->lock);
> +	guard(mutex, &chip->lock);
> +
>  	ret = lp5521_run_selftest(chip, buf);
> -	mutex_unlock(&chip->lock);
>  
>  	return sysfs_emit(buf, "%s\n", ret ? "FAIL" : "OK");
>  }
> diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
> index 095060533d1a..baa1a3ac1a56 100644
> --- a/drivers/leds/leds-lp5523.c
> +++ b/drivers/leds/leds-lp5523.c
> @@ -9,6 +9,7 @@
>   *          Milo(Woogyom) Kim <milo.kim@ti.com>
>   */
>  
> +#include <linux/cleanup.h>
>  #include <linux/delay.h>
>  #include <linux/firmware.h>
>  #include <linux/i2c.h>
> @@ -188,16 +189,16 @@ static ssize_t lp5523_selftest(struct device *dev,
>  	int ret, pos = 0;
>  	u8 status, adc, vdd, i;
>  
> -	mutex_lock(&chip->lock);
> +	guard(mutex, &chip->lock);
>  
>  	ret = lp55xx_read(chip, LP5523_REG_STATUS, &status);
>  	if (ret < 0)
> -		goto fail;
> +		return sysfs_emit(buf, "FAIL\n");
>  
>  	/* Check that ext clock is really in use if requested */
>  	if (pdata->clock_mode == LP55XX_CLOCK_EXT) {
>  		if  ((status & LP5523_EXT_CLK_USED) == 0)
> -			goto fail;
> +			return sysfs_emit(buf, "FAIL\n");
>  	}
>  
>  	/* Measure VDD (i.e. VBAT) first (channel 16 corresponds to VDD) */
> @@ -205,14 +206,14 @@ static ssize_t lp5523_selftest(struct device *dev,
>  	usleep_range(3000, 6000); /* ADC conversion time is typically 2.7 ms */
>  	ret = lp55xx_read(chip, LP5523_REG_STATUS, &status);
>  	if (ret < 0)
> -		goto fail;
> +		return sysfs_emit(buf, "FAIL\n");
>  
>  	if (!(status & LP5523_LEDTEST_DONE))
>  		usleep_range(3000, 6000); /* Was not ready. Wait little bit */
>  
>  	ret = lp55xx_read(chip, LP5523_REG_LED_TEST_ADC, &vdd);
>  	if (ret < 0)
> -		goto fail;
> +		return sysfs_emit(buf, "FAIL\n");
>  
>  	vdd--;	/* There may be some fluctuation in measurement */
>  
> @@ -235,14 +236,14 @@ static ssize_t lp5523_selftest(struct device *dev,
>  		usleep_range(3000, 6000);
>  		ret = lp55xx_read(chip, LP5523_REG_STATUS, &status);
>  		if (ret < 0)
> -			goto fail;
> +			return sysfs_emit(buf, "FAIL\n");
>  
>  		if (!(status & LP5523_LEDTEST_DONE))
>  			usleep_range(3000, 6000); /* Was not ready. Wait. */
>  
>  		ret = lp55xx_read(chip, LP5523_REG_LED_TEST_ADC, &adc);
>  		if (ret < 0)
> -			goto fail;
> +			return sysfs_emit(buf, "FAIL\n");
>  
>  		if (adc >= vdd || adc < LP5523_ADC_SHORTCIRC_LIM)
>  			pos += sysfs_emit_at(buf, pos, "LED %d FAIL\n",
> @@ -256,16 +257,8 @@ static ssize_t lp5523_selftest(struct device *dev,
>  			     led->led_current);
>  		led++;
>  	}
> -	if (pos == 0)
> -		pos = sysfs_emit(buf, "OK\n");
> -	goto release_lock;
> -fail:
> -	pos = sysfs_emit(buf, "FAIL\n");
>  
> -release_lock:
> -	mutex_unlock(&chip->lock);
> -
> -	return pos;
> +	return pos == 0 ? sysfs_emit(buf, "OK\n") : pos;
>  }
>  
>  LP55XX_DEV_ATTR_ENGINE_MODE(1);
> diff --git a/drivers/leds/leds-lp5562.c b/drivers/leds/leds-lp5562.c
> index 6ba5dbb9cace..69a4e3d5a126 100644
> --- a/drivers/leds/leds-lp5562.c
> +++ b/drivers/leds/leds-lp5562.c
> @@ -7,6 +7,7 @@
>   * Author: Milo(Woogyom) Kim <milo.kim@ti.com>
>   */
>  
> +#include <linux/cleanup.h>
>  #include <linux/delay.h>
>  #include <linux/firmware.h>
>  #include <linux/i2c.h>
> @@ -171,9 +172,9 @@ static int lp5562_led_brightness(struct lp55xx_led *led)
>  	};
>  	int ret;
>  
> -	mutex_lock(&chip->lock);
> +	guard(mutex, &chip->lock);
> +
>  	ret = lp55xx_write(chip, addr[led->chan_nr], led->brightness);
> -	mutex_unlock(&chip->lock);
>  
>  	return ret;
>  }
> @@ -268,9 +269,9 @@ static ssize_t lp5562_store_pattern(struct device *dev,
>  	if (mode > num_patterns || !ptn)
>  		return -EINVAL;
>  
> -	mutex_lock(&chip->lock);
> +	guard(mutex, &chip->lock);
> +
>  	ret = lp5562_run_predef_led_pattern(chip, mode);
> -	mutex_unlock(&chip->lock);
>  
>  	if (ret)
>  		return ret;
> @@ -320,9 +321,9 @@ static ssize_t lp5562_store_engine_mux(struct device *dev,
>  		return -EINVAL;
>  	}
>  
> -	mutex_lock(&chip->lock);
> +	guard(mutex, &chip->lock);
> +
>  	lp55xx_update_bits(chip, LP5562_REG_ENG_SEL, mask, val);
> -	mutex_unlock(&chip->lock);
>  
>  	return len;
>  }
> diff --git a/drivers/leds/leds-lp5569.c b/drivers/leds/leds-lp5569.c
> index e5e7e61c8916..dc8efb25b78e 100644
> --- a/drivers/leds/leds-lp5569.c
> +++ b/drivers/leds/leds-lp5569.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <linux/bitfield.h>
> +#include <linux/cleanup.h>
>  #include <linux/delay.h>
>  #include <linux/firmware.h>
>  #include <linux/i2c.h>
> @@ -396,17 +397,17 @@ static ssize_t lp5569_selftest(struct device *dev,
>  	struct lp55xx_chip *chip = led->chip;
>  	int i, pos = 0;
>  
> -	mutex_lock(&chip->lock);
> +	guard(mutex, &chip->lock);
>  
>  	/* Test LED Open */
>  	pos = lp5569_led_open_test(led, buf);
>  	if (pos < 0)
> -		goto fail;
> +		return sprintf(buf, "FAIL\n");
>  
>  	/* Test LED Shorted */
>  	pos += lp5569_led_short_test(led, buf);
>  	if (pos < 0)
> -		goto fail;
> +		return sprintf(buf, "FAIL\n");
>  
>  	for (i = 0; i < chip->pdata->num_channels; i++) {
>  		/* Restore current */
> @@ -419,16 +420,7 @@ static ssize_t lp5569_selftest(struct device *dev,
>  		led++;
>  	}
>  
> -	if (pos == 0)
> -		pos = sysfs_emit(buf, "OK\n");
> -	goto release_lock;
> -fail:
> -	pos = sysfs_emit(buf, "FAIL\n");
> -
> -release_lock:
> -	mutex_unlock(&chip->lock);
> -
> -	return pos;
> +	return pos == 0 ? sysfs_emit(buf, "OK\n") : pos;
>  }
>  
>  LP55XX_DEV_ATTR_ENGINE_MODE(1);
> diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
> index 1b71f512206d..f8cf5c0e983a 100644
> --- a/drivers/leds/leds-lp55xx-common.c
> +++ b/drivers/leds/leds-lp55xx-common.c
> @@ -10,6 +10,7 @@
>   */
>  
>  #include <linux/bitfield.h>
> +#include <linux/cleanup.h>
>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/firmware.h>
> @@ -272,10 +273,10 @@ int lp55xx_led_brightness(struct lp55xx_led *led)
>  	const struct lp55xx_device_config *cfg = chip->cfg;
>  	int ret;
>  
> -	mutex_lock(&chip->lock);
> +	guard(mutex, &chip->lock);
> +
>  	ret = lp55xx_write(chip, cfg->reg_led_pwm_base.addr + led->chan_nr,
>  			   led->brightness);
> -	mutex_unlock(&chip->lock);
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(lp55xx_led_brightness);
> @@ -287,7 +288,8 @@ int lp55xx_multicolor_brightness(struct lp55xx_led *led)
>  	int ret;
>  	int i;
>  
> -	mutex_lock(&chip->lock);
> +	guard(mutex, &chip->lock);
> +
>  	for (i = 0; i < led->mc_cdev.num_colors; i++) {
>  		ret = lp55xx_write(chip,
>  				   cfg->reg_led_pwm_base.addr +
> @@ -296,7 +298,7 @@ int lp55xx_multicolor_brightness(struct lp55xx_led *led)
>  		if (ret)
>  			break;
>  	}
> -	mutex_unlock(&chip->lock);
> +
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(lp55xx_multicolor_brightness);
> @@ -404,9 +406,9 @@ static ssize_t led_current_store(struct device *dev,
>  	if (!chip->cfg->set_led_current)
>  		return len;
>  
> -	mutex_lock(&chip->lock);
> +	guard(mutex, &chip->lock);
> +
>  	chip->cfg->set_led_current(led, (u8)curr);
> -	mutex_unlock(&chip->lock);
>  
>  	return len;
>  }
> @@ -541,14 +543,12 @@ static void lp55xx_firmware_loaded(const struct firmware *fw, void *context)
>  	}
>  
>  	/* handling firmware data is chip dependent */
> -	mutex_lock(&chip->lock);
> -
> -	chip->engines[idx - 1].mode = LP55XX_ENGINE_LOAD;
> -	chip->fw = fw;
> -	if (chip->cfg->firmware_cb)
> -		chip->cfg->firmware_cb(chip);
> -
> -	mutex_unlock(&chip->lock);
> +	scoped_guard(mutex, &chip->lock) {
> +		chip->engines[idx - 1].mode = LP55XX_ENGINE_LOAD;
> +		chip->fw = fw;
> +		if (chip->cfg->firmware_cb)
> +			chip->cfg->firmware_cb(chip);
> +	}
>  
>  	/* firmware should be released for other channel use */
>  	release_firmware(chip->fw);
> @@ -592,10 +592,10 @@ static ssize_t select_engine_store(struct device *dev,
>  	case LP55XX_ENGINE_1:
>  	case LP55XX_ENGINE_2:
>  	case LP55XX_ENGINE_3:
> -		mutex_lock(&chip->lock);
> -		chip->engine_idx = val;
> -		ret = lp55xx_request_firmware(chip);
> -		mutex_unlock(&chip->lock);
> +		scoped_guard(mutex, &chip->lock) {
> +			chip->engine_idx = val;
> +			ret = lp55xx_request_firmware(chip);
> +		}
>  		break;
>  	default:
>  		dev_err(dev, "%lu: invalid engine index. (1, 2, 3)\n", val);
> @@ -634,9 +634,9 @@ static ssize_t run_engine_store(struct device *dev,
>  		return len;
>  	}
>  
> -	mutex_lock(&chip->lock);
> +	guard(mutex, &chip->lock);
> +
>  	lp55xx_run_engine(chip, true);
> -	mutex_unlock(&chip->lock);
>  
>  	return len;
>  }
> @@ -673,7 +673,7 @@ ssize_t lp55xx_store_engine_mode(struct device *dev,
>  	const struct lp55xx_device_config *cfg = chip->cfg;
>  	struct lp55xx_engine *engine = &chip->engines[nr - 1];
>  
> -	mutex_lock(&chip->lock);
> +	guard(mutex, &chip->lock);
>  
>  	chip->engine_idx = nr;
>  
> @@ -689,8 +689,6 @@ ssize_t lp55xx_store_engine_mode(struct device *dev,
>  		engine->mode = LP55XX_ENGINE_DISABLED;
>  	}
>  
> -	mutex_unlock(&chip->lock);
> -
>  	return len;
>  }
>  EXPORT_SYMBOL_GPL(lp55xx_store_engine_mode);
> @@ -703,14 +701,12 @@ ssize_t lp55xx_store_engine_load(struct device *dev,
>  	struct lp55xx_chip *chip = led->chip;
>  	int ret;
>  
> -	mutex_lock(&chip->lock);
> +	guard(mutex, &chip->lock);
>  
>  	chip->engine_idx = nr;
>  	lp55xx_load_engine(chip);
>  	ret = lp55xx_update_program_memory(chip, buf, len);
>  
> -	mutex_unlock(&chip->lock);
> -
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(lp55xx_store_engine_load);
> @@ -804,21 +800,17 @@ ssize_t lp55xx_store_engine_leds(struct device *dev,
>  	if (lp55xx_mux_parse(chip, buf, &mux, len))
>  		return -EINVAL;
>  
> -	mutex_lock(&chip->lock);
> +	guard(mutex, &chip->lock);
>  
>  	chip->engine_idx = nr;
> -	ret = -EINVAL;
>  
>  	if (engine->mode != LP55XX_ENGINE_LOAD)
> -		goto leave;
> +		return -EINVAL;
>  
>  	if (lp55xx_load_mux(chip, mux, nr))
> -		goto leave;
> +		return -EINVAL;
>  
> -	ret = len;
> -leave:
> -	mutex_unlock(&chip->lock);
> -	return ret;
> +	return len;
>  }
>  EXPORT_SYMBOL_GPL(lp55xx_store_engine_leds);
>  
> @@ -832,9 +824,9 @@ ssize_t lp55xx_show_master_fader(struct device *dev,
>  	int ret;
>  	u8 val;
>  
> -	mutex_lock(&chip->lock);
> +	guard(mutex, &chip->lock);
> +
>  	ret = lp55xx_read(chip, cfg->reg_master_fader_base.addr + nr - 1, &val);
> -	mutex_unlock(&chip->lock);
>  
>  	return ret ? ret : sysfs_emit(buf, "%u\n", val);
>  }
> @@ -856,10 +848,10 @@ ssize_t lp55xx_store_master_fader(struct device *dev,
>  	if (val > 0xff)
>  		return -EINVAL;
>  
> -	mutex_lock(&chip->lock);
> +	guard(mutex, &chip->lock);
> +
>  	ret = lp55xx_write(chip, cfg->reg_master_fader_base.addr + nr - 1,
>  			   (u8)val);
> -	mutex_unlock(&chip->lock);
>  
>  	return ret ? ret : len;
>  }
> @@ -875,25 +867,22 @@ ssize_t lp55xx_show_master_fader_leds(struct device *dev,
>  	int i, ret, pos = 0;
>  	u8 val;
>  
> -	mutex_lock(&chip->lock);
> +	guard(mutex, &chip->lock);
>  
>  	for (i = 0; i < cfg->max_channel; i++) {
>  		ret = lp55xx_read(chip, cfg->reg_led_ctrl_base.addr + i, &val);
>  		if (ret)
> -			goto leave;
> +			return ret;
>  
>  		val = FIELD_GET(LP55xx_FADER_MAPPING_MASK, val);
>  		if (val > FIELD_MAX(LP55xx_FADER_MAPPING_MASK)) {
> -			ret = -EINVAL;
> -			goto leave;
> +			return -EINVAL;
>  		}
>  		buf[pos++] = val + '0';
>  	}
>  	buf[pos++] = '\n';
> -	ret = pos;
> -leave:
> -	mutex_unlock(&chip->lock);
> -	return ret;
> +
> +	return pos;
>  }
>  EXPORT_SYMBOL_GPL(lp55xx_show_master_fader_leds);
>  
> @@ -909,7 +898,7 @@ ssize_t lp55xx_store_master_fader_leds(struct device *dev,
>  
>  	n = min_t(int, len, cfg->max_channel);
>  
> -	mutex_lock(&chip->lock);
> +	guard(mutex, &chip->lock);
>  
>  	for (i = 0; i < n; i++) {
>  		if (buf[i] >= '0' && buf[i] <= '3') {
> @@ -919,16 +908,13 @@ ssize_t lp55xx_store_master_fader_leds(struct device *dev,
>  						 LP55xx_FADER_MAPPING_MASK,
>  						 val);
>  			if (ret)
> -				goto leave;
> +				return ret;
>  		} else {
> -			ret = -EINVAL;
> -			goto leave;
> +			return -EINVAL;
>  		}
>  	}
> -	ret = len;
> -leave:
> -	mutex_unlock(&chip->lock);
> -	return ret;
> +
> +	return len;
>  }
>  EXPORT_SYMBOL_GPL(lp55xx_store_master_fader_leds);
>  
> -- 
> 2.45.1
> 

-- 
Lee Jones [李琼斯]

