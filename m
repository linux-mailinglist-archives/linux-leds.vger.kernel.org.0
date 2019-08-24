Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABC0C9C0DD
	for <lists+linux-leds@lfdr.de>; Sun, 25 Aug 2019 00:59:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727740AbfHXW7I (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 24 Aug 2019 18:59:08 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46984 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727708AbfHXW7H (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 24 Aug 2019 18:59:07 -0400
Received: by mail-wr1-f65.google.com with SMTP id z1so11828934wru.13
        for <linux-leds@vger.kernel.org>; Sat, 24 Aug 2019 15:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:cc:references:to:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Su4W7eWW57PnS1V4yCZP6T5ikF/HRrpwdCXQOaRhR7M=;
        b=ZIwqc4emPdJ3nyI0IqzEkCqh3e0z2VTNTOClMa4ArvzV+q6b398rpYFxvnXS3xJ/zL
         5EsMct8buudecnk7qEk4OPeYvo9SRgIL98doTQI+pS1V5Qd3PdBK30SxlKMN/ZNS8OZY
         kmFkU2TlJ63xN5piWixBT9hC7RUpdW+DpQYL11zMoA4qq+kkU15oXCxhCpagi0q+wSOS
         zZ2JAcovfl/638ZVEXWg5QYUvm/l+HetCKrO2h6jn5Wzl3SBVzV00TePCFg5G09tMCnv
         xQAwpSjH0kc1OFk9gVyxVJUx6dtCKCB/sCZn2wQ4N6xe7EgJGTHJFy8Ngm6wksMJ0jMX
         WM8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:cc:references:to:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Su4W7eWW57PnS1V4yCZP6T5ikF/HRrpwdCXQOaRhR7M=;
        b=O+Lx03XX1xQxgq3fr3xPb/67CrwL5J77zTscIcCLSnOEVbQg8LpHDypgpT8bbUqla1
         FdurgDTdZm6EMsBlnEE3DNhFbd7FINelqVVZlBep3t2XUwH0FZQBW+Yb3vYCPDo0absz
         eSxq9lqAHzUMZP2MPOwFiWtNZpZTiP+kj3B4VE2IFzWcMTDy76coL4IOTlry5hq1buyf
         GwxFtO7D54fagLzlNKfXVNLyLJP+JW+oeILBAUOnHbOPQv3bUv+FFuitaj1L+kYuwp5g
         9ng3qj0q4wX6MB1DX9/NH0y/fWdO/kybbkJIONDeqoaXNu2YXNFMSa+3K6KHM71xfwHX
         tldQ==
X-Gm-Message-State: APjAAAXp3gqxoQE5fT24RERnhGmjQtXXJVnGNgbr3HgMRSNpzGPBEYTN
        ywJ7DbWPVfJ3qW5r9Pq2DHM=
X-Google-Smtp-Source: APXvYqwvJ4QAESDW090wLOVkX6aeq20727I4kbVMclgZT5nhbyNEZ1PTZTi9kUSBg3bWQG22jF2UDg==
X-Received: by 2002:a5d:4f81:: with SMTP id d1mr13158432wru.177.1566687542646;
        Sat, 24 Aug 2019 15:59:02 -0700 (PDT)
Received: from [192.168.1.19] (bkw182.neoplus.adsl.tpnet.pl. [83.28.190.182])
        by smtp.gmail.com with ESMTPSA id 39sm24135918wrc.45.2019.08.24.15.59.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 24 Aug 2019 15:59:02 -0700 (PDT)
Subject: Re: [j.anaszewski-leds:for-next 15/49]
 drivers/input/keyboard/applespi.c:1789: undefined reference to
 `devm_led_classdev_register_ext'
Cc:     kbuild test robot <lkp@intel.com>, kbuild-all@01.org,
        linux-leds@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
References: <201908250600.zVS5YXcp%lkp@intel.com>
To:     =?UTF-8?Q?Ronald_Tschal=c3=a4r?= <ronald@innovation.ch>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <38ecf451-5acc-1fef-1527-18546b282d8d@gmail.com>
Date:   Sun, 25 Aug 2019 00:58:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <201908250600.zVS5YXcp%lkp@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Ronald,

You're missing LEDS_CLASS dependency in Kconfig:

diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
index 8e9c3ea9d5e7..96285e071ee1 100644
--- a/drivers/input/keyboard/Kconfig
+++ b/drivers/input/keyboard/Kconfig
@@ -76,6 +76,7 @@ config KEYBOARD_APPLESPI
        depends on ACPI && EFI
        depends on SPI
        depends on X86 || COMPILE_TEST
+       depends on LEDS_CLASS
        help
          Say Y here if you are running Linux on any Apple MacBook8,1 or
later,
          or any MacBookPro13,* or MacBookPro14,*.

On 8/25/19 12:03 AM, kbuild test robot wrote:
> tree:   https://kernel.googlesource.com/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git for-next
> head:   fd81d7e946c6bdb86dbf0bd88fee3e1a545e7979
> commit: b2b998c0f944993c9ef435569651e407d607af41 [15/49] leds: class: Improve LED and LED flash class registration API
> config: i386-randconfig-h002-201934 (attached as .config)
> compiler: gcc-7 (Debian 7.4.0-10) 7.4.0
> reproduce:
>         git checkout b2b998c0f944993c9ef435569651e407d607af41
>         # save the attached .config to linux build tree
>         make ARCH=i386 
> 
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    ld: drivers/input/keyboard/applespi.o: in function `applespi_probe':
>>> drivers/input/keyboard/applespi.c:1789: undefined reference to `devm_led_classdev_register_ext'
> 
> vim +1789 drivers/input/keyboard/applespi.c
> 
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1620  
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1621  static int applespi_probe(struct spi_device *spi)
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1622  {
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1623  	struct applespi_data *applespi;
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1624  	acpi_handle spi_handle = ACPI_HANDLE(&spi->dev);
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1625  	acpi_status acpi_sts;
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1626  	int sts, i;
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1627  	unsigned long long gpe, usb_status;
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1628  
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1629  	/* check if the USB interface is present and enabled already */
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1630  	acpi_sts = acpi_evaluate_integer(spi_handle, "UIST", NULL, &usb_status);
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1631  	if (ACPI_SUCCESS(acpi_sts) && usb_status) {
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1632  		/* let the USB driver take over instead */
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1633  		dev_info(&spi->dev, "USB interface already enabled\n");
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1634  		return -ENODEV;
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1635  	}
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1636  
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1637  	/* allocate driver data */
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1638  	applespi = devm_kzalloc(&spi->dev, sizeof(*applespi), GFP_KERNEL);
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1639  	if (!applespi)
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1640  		return -ENOMEM;
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1641  
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1642  	applespi->spi = spi;
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1643  
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1644  	INIT_WORK(&applespi->work, applespi_worker);
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1645  
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1646  	/* store the driver data */
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1647  	spi_set_drvdata(spi, applespi);
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1648  
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1649  	/* create our buffers */
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1650  	applespi->tx_buffer = devm_kmalloc(&spi->dev, APPLESPI_PACKET_SIZE,
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1651  					   GFP_KERNEL);
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1652  	applespi->tx_status = devm_kmalloc(&spi->dev, APPLESPI_STATUS_SIZE,
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1653  					   GFP_KERNEL);
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1654  	applespi->rx_buffer = devm_kmalloc(&spi->dev, APPLESPI_PACKET_SIZE,
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1655  					   GFP_KERNEL);
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1656  	applespi->msg_buf = devm_kmalloc_array(&spi->dev, MAX_PKTS_PER_MSG,
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1657  					       APPLESPI_PACKET_SIZE,
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1658  					       GFP_KERNEL);
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1659  
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1660  	if (!applespi->tx_buffer || !applespi->tx_status ||
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1661  	    !applespi->rx_buffer || !applespi->msg_buf)
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1662  		return -ENOMEM;
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1663  
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1664  	/* set up our spi messages */
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1665  	applespi_setup_read_txfrs(applespi);
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1666  	applespi_setup_write_txfrs(applespi);
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1667  
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1668  	/* cache ACPI method handles */
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1669  	acpi_sts = acpi_get_handle(spi_handle, "SIEN", &applespi->sien);
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1670  	if (ACPI_FAILURE(acpi_sts)) {
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1671  		dev_err(&applespi->spi->dev,
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1672  			"Failed to get SIEN ACPI method handle: %s\n",
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1673  			acpi_format_exception(acpi_sts));
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1674  		return -ENODEV;
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1675  	}
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1676  
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1677  	acpi_sts = acpi_get_handle(spi_handle, "SIST", &applespi->sist);
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1678  	if (ACPI_FAILURE(acpi_sts)) {
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1679  		dev_err(&applespi->spi->dev,
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1680  			"Failed to get SIST ACPI method handle: %s\n",
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1681  			acpi_format_exception(acpi_sts));
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1682  		return -ENODEV;
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1683  	}
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1684  
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1685  	/* switch on the SPI interface */
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1686  	sts = applespi_setup_spi(applespi);
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1687  	if (sts)
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1688  		return sts;
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1689  
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1690  	sts = applespi_enable_spi(applespi);
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1691  	if (sts)
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1692  		return sts;
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1693  
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1694  	/* setup the keyboard input dev */
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1695  	applespi->keyboard_input_dev = devm_input_allocate_device(&spi->dev);
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1696  
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1697  	if (!applespi->keyboard_input_dev)
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1698  		return -ENOMEM;
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1699  
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1700  	applespi->keyboard_input_dev->name = "Apple SPI Keyboard";
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1701  	applespi->keyboard_input_dev->phys = "applespi/input0";
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1702  	applespi->keyboard_input_dev->dev.parent = &spi->dev;
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1703  	applespi->keyboard_input_dev->id.bustype = BUS_SPI;
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1704  
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1705  	applespi->keyboard_input_dev->evbit[0] =
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1706  			BIT_MASK(EV_KEY) | BIT_MASK(EV_LED) | BIT_MASK(EV_REP);
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1707  	applespi->keyboard_input_dev->ledbit[0] = BIT_MASK(LED_CAPSL);
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1708  
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1709  	input_set_drvdata(applespi->keyboard_input_dev, applespi);
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1710  	applespi->keyboard_input_dev->event = applespi_event;
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1711  
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1712  	for (i = 0; i < ARRAY_SIZE(applespi_scancodes); i++)
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1713  		if (applespi_scancodes[i])
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1714  			input_set_capability(applespi->keyboard_input_dev,
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1715  					     EV_KEY, applespi_scancodes[i]);
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1716  
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1717  	for (i = 0; i < ARRAY_SIZE(applespi_controlcodes); i++)
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1718  		if (applespi_controlcodes[i])
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1719  			input_set_capability(applespi->keyboard_input_dev,
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1720  					     EV_KEY, applespi_controlcodes[i]);
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1721  
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1722  	for (i = 0; i < ARRAY_SIZE(applespi_fn_codes); i++)
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1723  		if (applespi_fn_codes[i].to)
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1724  			input_set_capability(applespi->keyboard_input_dev,
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1725  					     EV_KEY, applespi_fn_codes[i].to);
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1726  
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1727  	input_set_capability(applespi->keyboard_input_dev, EV_KEY, KEY_FN);
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1728  
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1729  	sts = input_register_device(applespi->keyboard_input_dev);
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1730  	if (sts) {
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1731  		dev_err(&applespi->spi->dev,
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1732  			"Unable to register keyboard input device (%d)\n", sts);
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1733  		return -ENODEV;
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1734  	}
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1735  
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1736  	/*
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1737  	 * The applespi device doesn't send interrupts normally (as is described
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1738  	 * in its DSDT), but rather seems to use ACPI GPEs.
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1739  	 */
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1740  	acpi_sts = acpi_evaluate_integer(spi_handle, "_GPE", NULL, &gpe);
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1741  	if (ACPI_FAILURE(acpi_sts)) {
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1742  		dev_err(&applespi->spi->dev,
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1743  			"Failed to obtain GPE for SPI slave device: %s\n",
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1744  			acpi_format_exception(acpi_sts));
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1745  		return -ENODEV;
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1746  	}
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1747  	applespi->gpe = (int)gpe;
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1748  
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1749  	acpi_sts = acpi_install_gpe_handler(NULL, applespi->gpe,
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1750  					    ACPI_GPE_LEVEL_TRIGGERED,
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1751  					    applespi_notify, applespi);
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1752  	if (ACPI_FAILURE(acpi_sts)) {
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1753  		dev_err(&applespi->spi->dev,
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1754  			"Failed to install GPE handler for GPE %d: %s\n",
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1755  			applespi->gpe, acpi_format_exception(acpi_sts));
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1756  		return -ENODEV;
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1757  	}
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1758  
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1759  	applespi->suspended = false;
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1760  
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1761  	acpi_sts = acpi_enable_gpe(NULL, applespi->gpe);
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1762  	if (ACPI_FAILURE(acpi_sts)) {
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1763  		dev_err(&applespi->spi->dev,
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1764  			"Failed to enable GPE handler for GPE %d: %s\n",
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1765  			applespi->gpe, acpi_format_exception(acpi_sts));
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1766  		acpi_remove_gpe_handler(NULL, applespi->gpe, applespi_notify);
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1767  		return -ENODEV;
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1768  	}
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1769  
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1770  	/* trigger touchpad setup */
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1771  	applespi_init(applespi, false);
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1772  
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1773  	/*
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1774  	 * By default this device is not enabled for wakeup; but USB keyboards
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1775  	 * generally are, so the expectation is that by default the keyboard
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1776  	 * will wake the system.
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1777  	 */
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1778  	device_wakeup_enable(&spi->dev);
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1779  
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1780  	/* set up keyboard-backlight */
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1781  	sts = applespi_get_saved_bl_level(applespi);
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1782  	if (sts >= 0)
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1783  		applespi_set_bl_level(&applespi->backlight_info, sts);
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1784  
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1785  	applespi->backlight_info.name            = "spi::kbd_backlight";
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1786  	applespi->backlight_info.default_trigger = "kbd-backlight";
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1787  	applespi->backlight_info.brightness_set  = applespi_set_bl_level;
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1788  
> 038b1a05eae666 Ronald Tschalär 2019-07-15 @1789  	sts = devm_led_classdev_register(&spi->dev, &applespi->backlight_info);
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1790  	if (sts)
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1791  		dev_warn(&applespi->spi->dev,
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1792  			 "Unable to register keyboard backlight class dev (%d)\n",
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1793  			 sts);
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1794  
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1795  	/* set up debugfs entries for touchpad dimensions logging */
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1796  	applespi->debugfs_root = debugfs_create_dir("applespi", NULL);
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1797  	if (IS_ERR(applespi->debugfs_root)) {
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1798  		if (PTR_ERR(applespi->debugfs_root) != -ENODEV)
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1799  			dev_warn(&applespi->spi->dev,
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1800  				 "Error creating debugfs root entry (%ld)\n",
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1801  				 PTR_ERR(applespi->debugfs_root));
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1802  	} else {
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1803  		struct dentry *ret;
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1804  
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1805  		ret = debugfs_create_bool("enable_tp_dim", 0600,
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1806  					  applespi->debugfs_root,
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1807  					  &applespi->debug_tp_dim);
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1808  		if (IS_ERR(ret))
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1809  			dev_dbg(&applespi->spi->dev,
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1810  				"Error creating debugfs entry enable_tp_dim (%ld)\n",
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1811  				PTR_ERR(ret));
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1812  
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1813  		ret = debugfs_create_file("tp_dim", 0400,
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1814  					  applespi->debugfs_root, applespi,
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1815  					  &applespi_tp_dim_fops);
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1816  		if (IS_ERR(ret))
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1817  			dev_dbg(&applespi->spi->dev,
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1818  				"Error creating debugfs entry tp_dim (%ld)\n",
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1819  				PTR_ERR(ret));
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1820  	}
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1821  
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1822  	return 0;
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1823  }
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1824  
> 
> :::::: The code at line 1789 was first introduced by commit
> :::::: 038b1a05eae6666b731920e46f47d8e2332e07ff Input: add Apple SPI keyboard and trackpad driver
> 
> :::::: TO: Ronald Tschalär <ronald@innovation.ch>
> :::::: CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
> 

-- 
Best regards,
Jacek Anaszewski
