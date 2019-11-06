Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CF58F19B6
	for <lists+linux-leds@lfdr.de>; Wed,  6 Nov 2019 16:16:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727548AbfKFPQv (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 6 Nov 2019 10:16:51 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35682 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727202AbfKFPQu (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 6 Nov 2019 10:16:50 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id 35DC528ECFA
Subject: Re: [PATCH v8 2/2] power_supply: platform/chrome: wilco_ec: Add
 charging config driver
To:     Nick Crews <ncrews@chromium.org>, bleung@chromium.org,
        linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com,
        pavel@ucw.cz
Cc:     linux-kernel@vger.kernel.org, arnd@arndb.de,
        weiyongjun1@huawei.com, dlaurie@chromium.org, djkurtz@chromium.org,
        dtor@google.com, sjg@chromium.org, groeck@chromium.com,
        Daniel Campello <campello@chromium.org>
References: <20191024222805.183642-1-ncrews@chromium.org>
 <20191024222805.183642-2-ncrews@chromium.org>
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <94adea8f-6836-c026-7e34-8ea196a558ee@collabora.com>
Date:   Wed, 6 Nov 2019 16:16:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191024222805.183642-2-ncrews@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Nick, Daniel,

On 25/10/19 0:28, Nick Crews wrote:
> Add a device to control the charging algorithm used on Wilco devices,
> which will be picked up by the drivers/power/supply/wilco-charger.c
> driver. See Documentation/ABI/testing/sysfs-class-power-wilco for the
> userspace interface and other info.
> 
> Signed-off-by: Nick Crews <ncrews@chromium.org>

Applied for 5.5.

Thanks,
 Enric

> ---
>  drivers/platform/chrome/wilco_ec/core.c | 15 ++++++++++++++-
>  include/linux/platform_data/wilco-ec.h  |  2 ++
>  2 files changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/chrome/wilco_ec/core.c b/drivers/platform/chrome/wilco_ec/core.c
> index 36c78e52ff3c..5210c357feef 100644
> --- a/drivers/platform/chrome/wilco_ec/core.c
> +++ b/drivers/platform/chrome/wilco_ec/core.c
> @@ -98,6 +98,16 @@ static int wilco_ec_probe(struct platform_device *pdev)
>  		goto unregister_rtc;
>  	}
>  
> +	/* Register child device to be found by charger config driver. */
> +	ec->charger_pdev = platform_device_register_data(dev, "wilco-charger",
> +							 PLATFORM_DEVID_AUTO,
> +							 NULL, 0);
> +	if (IS_ERR(ec->charger_pdev)) {
> +		dev_err(dev, "Failed to create charger platform device\n");
> +		ret = PTR_ERR(ec->charger_pdev);
> +		goto remove_sysfs;
> +	}
> +
>  	/* Register child device that will be found by the telemetry driver. */
>  	ec->telem_pdev = platform_device_register_data(dev, "wilco_telem",
>  						       PLATFORM_DEVID_AUTO,
> @@ -105,11 +115,13 @@ static int wilco_ec_probe(struct platform_device *pdev)
>  	if (IS_ERR(ec->telem_pdev)) {
>  		dev_err(dev, "Failed to create telemetry platform device\n");
>  		ret = PTR_ERR(ec->telem_pdev);
> -		goto remove_sysfs;
> +		goto unregister_charge_config;
>  	}
>  
>  	return 0;
>  
> +unregister_charge_config:
> +	platform_device_unregister(ec->charger_pdev);
>  remove_sysfs:
>  	wilco_ec_remove_sysfs(ec);
>  unregister_rtc:
> @@ -125,6 +137,7 @@ static int wilco_ec_remove(struct platform_device *pdev)
>  {
>  	struct wilco_ec_device *ec = platform_get_drvdata(pdev);
>  
> +	platform_device_unregister(ec->charger_pdev);
>  	wilco_ec_remove_sysfs(ec);
>  	platform_device_unregister(ec->telem_pdev);
>  	platform_device_unregister(ec->rtc_pdev);
> diff --git a/include/linux/platform_data/wilco-ec.h b/include/linux/platform_data/wilco-ec.h
> index 0f7df3498a24..afede15a95bf 100644
> --- a/include/linux/platform_data/wilco-ec.h
> +++ b/include/linux/platform_data/wilco-ec.h
> @@ -29,6 +29,7 @@
>   * @data_size: Size of the data buffer used for EC communication.
>   * @debugfs_pdev: The child platform_device used by the debugfs sub-driver.
>   * @rtc_pdev: The child platform_device used by the RTC sub-driver.
> + * @charger_pdev: Child platform_device used by the charger config sub-driver.
>   * @telem_pdev: The child platform_device used by the telemetry sub-driver.
>   */
>  struct wilco_ec_device {
> @@ -41,6 +42,7 @@ struct wilco_ec_device {
>  	size_t data_size;
>  	struct platform_device *debugfs_pdev;
>  	struct platform_device *rtc_pdev;
> +	struct platform_device *charger_pdev;
>  	struct platform_device *telem_pdev;
>  };
>  
> 
